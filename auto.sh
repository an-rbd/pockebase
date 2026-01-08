#!/bin/bash

git clone https://github.com/an-rbd/pockebase.git

cd pockebase
chmod +x *.sh
set -e

echo "Install BACKEND"
./setup-pocketbase.sh

echo "Install FRONTEND"
./app.sh

echo "Install UNAMI"
./install-docker.sh
./unami.sh

echo "Service pret a l'utilisation"