#/bin/bash
set -ex
exec 2>&1 

RABBIT_URL=${1:-"https://github.com/rabbitmq/rabbitmq-server/releases/download/rabbitmq_v3_5_6/rabbitmq-server_3.5.6-1_all.deb"}

wget -q -O /tmp/rabbit.deb "$RABBIT_URL"
dpkg -i /tmp/rabbit.deb || apt-get -y -f install
cp /vagrant/rabbit-generated.conf /etc/rabbitmq/rabbitmq.config

service rabbitmq-server stop
echo DPMDALGUKEOMPTHWPYKC > /var/lib/rabbitmq/.erlang.cookie
chown rabbitmq:rabbitmq /var/lib/rabbitmq/.erlang.cookie
chmod 0600 /var/lib/rabbitmq/.erlang.cookie
rabbitmq-plugins enable rabbitmq_management
service rabbitmq-server start
rabbitmqctl delete_user test || true
rabbitmqctl add_user test test
rabbitmqctl set_permissions test ".*" ".*" ".*"
service rabbitmq-server stop
