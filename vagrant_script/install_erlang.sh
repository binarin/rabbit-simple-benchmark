#/bin/bash
set -ex
exec 2>&1 

ERLANG_URL=${1:-"http://packages.erlang-solutions.com/site/esl/esl-erlang/FLAVOUR_1_general/esl-erlang_18.1-1~ubuntu~trusty_amd64.deb"}

if [[ $ERLANG_URL == stock ]]; then
    apt-get install -y erlang-nox
elif [[ $ERLANG_URL =~ ^/vagrant/.*[.]deb$ ]]; then
    dpkg -i $ERLANG_URL || apt-get -y -f install
else
    wget -q -O /tmp/erlang.deb "$ERLANG_URL"
    dpkg -i /tmp/erlang.deb || apt-get -y -f install
fi
