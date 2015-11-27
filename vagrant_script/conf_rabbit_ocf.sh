#!/bin/sh
set -x
exec 2>&1 
wget -q ${1:-https://raw.githubusercontent.com/rabbitmq/rabbitmq-server/stable/packaging/common/rabbitmq-server-ha.ocf} \
-O /tmp/rabbitmq-server-ha
chmod +x /tmp/rabbitmq-server-ha
# HA policy is managed by benchmark itself
cat /tmp/rabbitmq-server-ha | grep -v 'set_policy' > /usr/lib/ocf/resource.d/rabbitmq/
exit 0
