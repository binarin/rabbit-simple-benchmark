#!/bin/bash
set -ex
exec 2>&1 

APT_PROXY_URL=$1
if [[ -z $APT_PROXY_URL ]]; then
    echo Acquire::http::Proxy \"$APT_PROXY_URL\" > /etc/apt/apt.conf.d/proxy
fi

apt-get update
locale-gen ru_RU.UTF-8

apt-get install -y crmsh pacemaker corosync cluster-glue resource-agents libqb0

# Enable corosync and pacemaker
sed -i 's/START=no/START=yes/g' /etc/default/corosync
update-rc.d pacemaker start 20 2 3 4 5 . stop 00 0 1 6 .
service corosync start
service pacemaker start
