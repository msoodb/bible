#!/bin/bash


# Installation
dnf update -y
dnf install epel-release -y
dnf install -y gcc gettext autoconf libtool automake make pcre-devel asciidoc xmlto udns-devel \
 libev-devel libsodium-devel mbedtls-devel git m2crypto c-ares-devel

cd /opt
git clone https://github.com/shadowsocks/shadowsocks-libev.git
git submodule update --init --recursive
./autogen.sh
./configure
make && make install

# Configuring the Shadowsocks
adduser --system --no-create-home -s /bin/false shadowsocks
mkdir -m 755 /etc/shadowsocks
touch & vi /etc/shadowsocks/shadowsocks.json
{
"server":"your_server_IP",
"server_port":8388,
"password":"your_password",
"timeout":300,
"method":"aes-256-gcm",
"fast_open": true
}

# Service
touch & vi /etc/systemd/system/shadowsocks.service

[Unit]
Description=Shadowsocks proxy server

[Service]
User=root
Group=root
Type=simple
ExecStart=/usr/local/bin/ss-server -c /etc/shadowsocks/shadowsocks.json -a shadowsocks -v start
ExecStop=/usr/local/bin/ss-server -c /etc/shadowsocks/shadowsocks.json -a shadowsocks -v stop

[Install]
WantedBy=multi-user.target

# Start service
systemctl daemon-reload
systemctl enable shadowsocks
systemctl start shadowsocks

# iptables
iptables -4 -A INPUT -p tcp --dport 8388 -m comment --comment "Shadowsocks" -j ACCEPT