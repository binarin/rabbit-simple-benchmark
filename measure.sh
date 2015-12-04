#!/bin/bash
set -ex

ALL_RABBITS=${ALL_RABBITS:-3.5.6 3.5.4 3.6.0-rc1}
ALL_MESSAGE_SIZES=${ALL_MESSAGE_SIZES:-5000 25000 50000}
ALL_ERLANGS=${ALL_ERLANGS:-18.1 stock}

main() {
    setup_proxy
    for ERLANG in $ALL_ERLANGS; do
        for RABBIT in $ALL_RABBITS; do
            for HIPE_COMPILE in true false; do
                for STATS in tuned_stats default; do
                    for FHC_READ_BUFFERING in false true; do
                        for RABBIT_HA in false true; do
                            prepare_benchmark || continue
                            for MESSAGE_SIZE in $ALL_MESSAGE_SIZES; do
                                echo Staring: $(describe_benchmark)
                                benchmark || echo Failed $(describe_benchmark) | tee -a fail.log
                            done
                        done
                    done
                done
            done
        done
    done
}

prepare_benchmark() {

    CAN_DISABLE_FHC_READ_BUFFERING=false
    CAN_HIPE_COMPILE=false

    vagrant destroy -f
    # vagrant halt -f
    bake_rabbit_config
    bake_rabbit_post_install_script

    erlang_url $ERLANG
    rabbit_url $RABBIT

    echo $CAN_DISABLE_FHC_READ_BUFFERING != true \&\& $FHC_READ_BUFFERING == false
    if [[ $CAN_DISABLE_FHC_READ_BUFFERING != true && $FHC_READ_BUFFERING == false ]]; then
        echo Skipping due to FHC - $(describe_benchmark)
        return 1
    fi

    if [[ $CAN_HIPE_COMPILE != true && $HIPE_COMPILE == true ]]; then
        echo Skipping due to HIPE - $(describe_benchmark)
        return 1
    fi

    time \
        SLAVES_COUNT=2 \
        ERLANG_URL=$ERLANG_URL \
        RABBIT_URL=$RABBIT_URL \
        vagrant up --provider libvirt --parallel --provision

    join_rabbits
    return 0
}

benchmark() {
    for try_no in $(seq 1 5); do
        echo $(describe_benchmark) $(run_benchmark) | tee -a result.log
    done
}

join_rabbits() {
    set +e
    vagrant ssh n2 -c "sudo rabbitmqctl stop_app"
    vagrant ssh n2 -c "sudo rabbitmqctl join_cluster rabbit@n1"
    vagrant ssh n2 -c "sudo rabbitmqctl start_app"

    vagrant ssh n3 -c "sudo rabbitmqctl stop_app"
    vagrant ssh n3 -c "sudo rabbitmqctl join_cluster rabbit@n1"
    vagrant ssh n3 -c "sudo rabbitmqctl start_app"

    if [[ $RABBIT_HA == true ]]; then
        vagrant ssh n1 -c 'sudo rabbitmqctl set_policy ha-all ".*" '"'"'{"ha-mode":"all"}'"'"
    else
        vagrant ssh n1 -c 'sudo rabbitmqctl clear_policy ha-all'
    fi

    set -e

    node_count=$(vagrant ssh n1 -c "sudo rabbitmqctl cluster_status" 2> /dev/null | grep running_nodes | perl -nE '/\[(.*)\]/ && do { my $a = $1; $a =~ s/,/\n/g; say  $a }' | wc -l)
    if [[ $node_count != 3 ]]; then
        echo Failed to assemble cluster: has $node_count nodes
        exit 1
    fi
}

run_benchmark() {
    result=$(
        set -e
        cd /home/binarin/mirantis-workspace/r-j/rabbitmq-java-client/build/dist

        # Consume from n2
        ./runjava.sh com.rabbitmq.examples.PerfTest -z 10 -e exchange_name -t topic -u queue_name -f transient \
                     -C 128000 -c 1 -r 640 -s $MESSAGE_SIZE -x0 -y50 \
                     --uri amqp://test:test@10.10.10.3:5672 2>&1 > /dev/null & consumer_pid=$!

        ./runjava.sh com.rabbitmq.examples.PerfTest -z 10 -e exchange_name -t topic -u queue_name -f transient -C 512000 -c 1 -r 640 -s $MESSAGE_SIZE -x100 -y0 --uri amqp://test:test@10.10.10.2:5672 \
            | fgrep ' rate avg:'

        kill $consumer_pid 2>&1 > /dev/null || true
    )
    rate=$(echo $result | perl -nE 'say $1 if /sending rate avg: (\d+)/')
    echo $rate
}

bake_rabbit_post_install_script() {
    echo "set -x" > rabbit_post_inst.sh
}

set_stats_vars() {
    case $STATS in
        tuned_stats)
            RATES_MODE=none
            STATS_INTERVAL=30000
            ;;
        default)
            RATES_MODE=basic
            STATS_INTERVAL=5000
            ;;
        *)
            echo "Unknown stats mode: $STATS"
            exit 1
            ;;
        
    esac

}

fail() {
    echo $1
    exit 1
}

bake_rabbit_config() {
    set_stats_vars
    cat <<EOF > rabbit-generated.conf
[
{rabbit, [
    {hipe_compile, $HIPE_COMPILE}
   ,{collect_statistics_interval, $STATS_INTERVAL}
   ,{fhc_read_buffering, $FHC_READ_BUFFERING}
]},
{rabbitmq_management, [
   {rates_mode, $RATES_MODE}
]}
].
EOF
}

erlang_url() {
    case $1 in
        stock)
            ERLANG_URL=stock
            ;;
        18.1)
            deb=esl-erlang_18.1-1~ubuntu~trusty_amd64.deb
            [ -f "$deb" ] || wget -q -O $deb "${PROXY_OR_SCHEMA}packages.erlang-solutions.com/site/esl/esl-erlang/FLAVOUR_1_general/$deb"
            [ -s "$deb" ] || fail "Failed to get $deb"
            ERLANG_URL="/vagrant/$deb"
            ;;
        *)
            echo "Unknown erlang $1"
            exit 1
            ;;
    esac
}

describe_benchmark() {
    echo ERLANG=$ERLANG,RABBIT=$RABBIT,HIPE_COMPILE=$HIPE_COMPILE,STATS=$STATS,FHC_READ_BUFFERING=$FHC_READ_BUFFERING,RABBIT_HA=$RABBIT_HA,MESSAGE_SIZE=$MESSAGE_SIZE
}

rabbit_url() {
    local deb
    case $1 in
        3.5.6)
            CAN_DISABLE_FHC_READ_BUFFERING=true
            CAN_HIPE_COMPILE=true
            deb=rabbitmq-server_3.5.6-1_all.deb
            [ -f "$deb" ] || wget -q -O $deb "https://github.com/rabbitmq/rabbitmq-server/releases/download/rabbitmq_v3_5_6/$deb"
            [ -s "$deb" ] || fail "Failed to get $deb"
            RABBIT_URL="/vagrant/$deb"
            ;;
        3.5.4)
            CAN_HIPE_COMPILE=true
            deb=rabbitmq-server_3.5.4-1_all.deb
            [ -f "$deb" ]] || wget -q -O $deb "https://github.com/rabbitmq/rabbitmq-server/releases/download/rabbitmq_v3_5_4/$deb"
            [ -s "$deb" ] || fail "Failed to get $deb"
            RABBIT_URL="/vagrant/$deb"
            ;;
        3.6.0-rc1)
            CAN_DISABLE_FHC_READ_BUFFERING=true
            deb=rabbitmq-server_3.5.903-1_all.deb
            [ -f "$deb" ] || wget -q -O $deb "https://github.com/rabbitmq/rabbitmq-server/releases/download/rabbitmq_v3_6_0_rc1/$deb"
            [ -s "$deb" ] || fail "Failed to get $deb"
            RABBIT_URL="/vagrant/$deb"
            ;;
        *)
            echo Unknown rabbit $RABBIT
            exit 1
            ;;
    esac
}

setup_proxy() {
    case $APT_PROXY_URL in
        http*/)
            PROXY_OR_SCHEMA=$APT_PROXY_URL
        ;;
        http*)
            PROXY_OR_SCHEMA=$APT_PROXY_URL/
        ;;
        *)
            PROXY_OR_SCHEMA=http://
        ;;
    esac
}

main
