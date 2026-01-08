#!/bin/bash
IP_UMAMI="172.24.136.6"
IP_BACKEND="172.24.140.14"
IP_FRONT="172.24.138.203"
PB_USER=$(whoami)
PB_INSTALL_DIR="/usr/local/bin"
PB_DATA_DIR="/home/$PB_USER/pocketbase_data"
ADMIN_EMAIL="mail@gmail.com"
ADMIN_PASS="useruser"
TMUX_SESSION="pocketbase"

wget https://github.com/pocketbase/pocketbase/releases/download/v0.35.0/pocketbase_0.35.0_linux_amd64.zip -O pocketbase.zip
echo "-- dl pocketbase --"
unzip pocketbase.zip -d pocketbase
echo "-- unzip --"
cd pocketbase
chmod +x pocketbase
echo "-- execution fichier --"
./pocketbase superuser create $ADMIN_EMAIL $ADMIN_PASS
echo "-- creation admin --"
sudo git clone https://github.com/nexus9111/migrations-sdv-b2b/
echo "-- clon github --"
sudo mv migrations-sdv-b2b/ pb_migrations
echo "-- creation migration --"
./pocketbase migrate
echo "-- migrate --"
tmux new-session -d -s $TMUX_SESSION ./pocketbase serve --http=$IP_BACKEND:4242
echo "-- session tmuux --"
echo "-- serve start --"
echo "URL console : http://$IP_BACKEND:4242/_/"
echo "URL api : http://$IP_BACKEND:4242/api/"
echo "Nom de la session tmux : $TMUX_SESSION"