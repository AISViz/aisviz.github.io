#!/bin/bash

# A setup script for running the AISDB receiver client.
# installs a service to $HOME/ais_rcv.service to start the receiver
# at boot.

# # incoming AIS messages will be forwarded to the following UDP address.
# # the --server-addr option may be repeated in ExecStart multiple times,
# # see `mproxy-client --help` for more info
# SERVER_ADDRESS="aisviz.cs.dal.ca:9921"

echo -e "================================================"
echo -e "🚀 \033[32mAISDB Antenna Setup\033[0m 🚀"
echo -e "   Version 1.0.0"
echo -e "================================================"

DEFAULT_SERVER="aisviz.cs.dal.ca:9921"
read -p $'\033[32mEnter server address the singal will be sent to (default: '"$DEFAULT_SERVER"$'): \033[0m' SERVER_INPUT
SERVER_ADDRESS=${SERVER_INPUT:-$DEFAULT_SERVER}

# Prompt for backup interval
read -p $'\033[32mEnter number of days to keep data locally (default: 0, no backup): \033[0m' BACKUP_DAYS
BACKUP_PARAM=""
if [ ! -z "$BACKUP_DAYS" ] && [ "$BACKUP_DAYS" -gt 0 ] 2>/dev/null; then
    BACKUP_PARAM="--backup-interval $BACKUP_DAYS"
fi

set -e

cd $HOME

# software updates
sudo apt-get update -y
sudo apt-get upgrade -y

# install rust toolchain for AISDB dispatcher
[[ ! -f $HOME/.cargo/bin/rustup ]] && curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --profile minimal
source $HOME/.cargo/env

# install AISDB dispatch client
CARGO_REGISTRIES_CRATES_IO_PROTOCOL=sparse cargo install --git https://github.com/AISViz/mproxy-dispatcher mproxy-client

# install the receiver service
[[ ! -f $HOME/ais_rcv.service ]] && cat <<EOF > "$HOME/ais_rcv.service"
[Unit]
Description="AISDB Receiver"
After=network-online.target
Documentation=https://aisviz.gitbook.io/documentation/default-start/ais-hardware

[Service]
Type=simple
User=$USER
ExecStart=$HOME/.cargo/bin/mproxy-client --path /dev/ttyACM0 --server-addr $SERVER_ADDRESS $BACKUP_PARAM
Restart=always
RestartSec=30

[Install]
WantedBy=default.target
EOF

# start and enable the service at boot
sudo systemctl enable systemd-networkd-wait-online.service
sudo systemctl link ./ais_rcv.service
sudo systemctl daemon-reload
sudo systemctl enable ais_rcv
sudo systemctl start ais_rcv

echo -e '🍺 \033[32mInstalled AISDB dispatch client\033[0m'
echo -e "🍺 \033[32mInstalled AISDB systemd service to $HOME/ais_rcv.service\033[0m"
echo -e "✅ \033[32mAISDB Antenna is now running\033[0m"
