#!/bin/bash
set -ex
exec 2>&1 
locale-gen ru_RU.UTF-8

ERLANG_URL=${1:-"http://packages.erlang-solutions.com/site/esl/esl-erlang/FLAVOUR_1_general/esl-erlang_18.1-1~ubuntu~trusty_amd64.deb"}
RABBITMQ_URL=${2:-"https://github.com/rabbitmq/rabbitmq-server/releases/download/rabbitmq_v3_5_6/rabbitmq-server_3.5.6-1_all.deb"}
apt-get update

wget -q -O /tmp/erlang.deb "$ERLANG_URL"
dpkg -i /tmp/erlang.deb || apt-get -y -f install
    
wget -q -O /tmp/rabbitmq.deb "$RABBITMQ_URL"
dpkg -i /tmp/rabbitmq.deb || apt-get -y -f install

service rabbitmq-server stop

apt-get install -y crmsh pacemaker corosync cluster-glue resource-agents libqb0

# Enable corosync and pacemaker
sed -i 's/START=no/START=yes/g' /etc/default/corosync
update-rc.d pacemaker start 20 2 3 4 5 . stop 00 0 1 6 .
service corosync start
service pacemaker start
