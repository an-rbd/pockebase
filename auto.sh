#!/bin/bash

git clone https://github.com/an-rbd/pockebase.git

cd /pockebase/bash
chmod +x *.sh
set -e
cd pockebase

echo "Install BACKEND"
./bash/setup-pocketbase.sh

echo "Install FRONTEND"
./bash/app.sh

echo "Install UNAMI"
./bash/install-docker.sh
./bash/unami.sh

echo "Service pret a l'utilisation"