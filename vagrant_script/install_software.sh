#!/bin/bash
set -ex
exec 2>&1 

APT_PROXY_URL=$1
if [[ -z $APT_PROXY_URL ]]; then
    echo Acquire::http::Proxy \"$APT_PROXY_URL\" > /etc/apt/apt.conf.d/proxy
fi

apt-get update
locale-gen ru_RU.UTF-8
