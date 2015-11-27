#!/bin/bash
set -e

main() {
    setup_proxy
    for ERLANG in 18.1 stock; do
        for RABBIT in 3.5.4 3.5.6; do
            for HIPE_COMPILE in false true; do
                for STATS in default tuned_stats; do
                    for FHC_READ_BUFFERING in true false; do
                        if [[ $RABBIT != 3.5.6 && $FHC_READ_BUFFERING == false ]]; then
                            continue
                        fi
                        for RABBIT_HA in true false; do
                            for MESSAGE_SIZE in 5000 50000; do
                                echo Staring: $(describe_benchmark)
                                benchmark || echo Failed $(describe_benchmark)
                                break 7
                            done
                        done
                    done
                done
            done
        done
    done
}

benchmark() {
    vagrant destroy -f
    bake_rabbit_config
    bake_rabbit_post_install_script
    time
        ERLANG_URL=$(erlang_url $ERLANG) \
        RABBIT_URL=$(rabbit_url $RABBIT) \
        vagrant up --provider libvirt --no-parallel
        
    echo $(describe_benchmark) $(run_benchmark) | tee -a result.log
    echo $(describe_benchmark) $(run_benchmark) | tee -a result.log
    echo $(describe_benchmark) $(run_benchmark) | tee -a result.log
}

run_benchmark() {
    result=$(
        set -e
        cd /home/binarin/mirantis-workspace/r-j/rabbitmq-java-client/build/dist
        ./runjava.sh com.rabbitmq.examples.PerfTest -z 10 -e exchange_name -t topic -u queue_name -f transient -C 64000 -c 1 -r 640 -s $MESSAGE_SIZE -x100 -y50 --uri amqp://test:test@10.10.10.2:5672 \
                     | fgrep ' rate avg:'
    )
    rate=$(echo $result | perl -nE 'say $1 if /sending rate avg: (\d+)/')
    echo $rate
}

bake_rabbit_post_install_script() {
    echo -n > rabbit_post_inst.sh
    if [[ $RABBIT_HA == true ]]; then
        echo 'rabbitmqctl set_policy ha-all "^ha\." '"'"'{"ha-mode":"all"}'"'" > rabbit_post_inst.sh
    fi
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
            echo stock
            ;;
        18.1)
            echo "${PROXY_OR_SCHEMA}packages.erlang-solutions.com/site/esl/esl-erlang/FLAVOUR_1_general/esl-erlang_18.1-1~ubuntu~trusty_amd64.deb"
            ;;
        *)
            echo "Unknown erlang $1"
            exit 1
            ;;
    esac
}

describe_benchmark() {
    echo ERLANG=$ERLANG,RABBIT=$RABBIT,HIPE_COMPILE=$HIPE_COMPILE,STATS=$STATS,FHC_READ_BUFFERING=$FHC_READ_BUFFERINGMESSAGE_SIZE=$MESSAGE_SIZE
}

rabbit_url() {
    case $1 in
        3.5.6)
            echo "https://github.com/rabbitmq/rabbitmq-server/releases/download/rabbitmq_v3_5_6/rabbitmq-server_3.5.6-1_all.deb"
            ;;
        3.5.4)
            echo "https://github.com/rabbitmq/rabbitmq-server/releases/download/rabbitmq_v3_5_4/rabbitmq-server_3.5.4-1_all.deb"
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
