#!/bin/bash

git clone https://github.com/an-rbd/pockebase.git

cd /pockebase/bash
chmod +x *.sh
set -e
cd pockebase

echo "Install BACKEND"
ssh nom@ip -p 4222 'bash -s' < ./setup-pocketbase.sh

echo "Install FRONTEND"
ssh nom@ip -p 4222 'bash -s' < ./app.sh

echo "Install UNAMI"
ssh nom@ip -p 4222 'bash -s' < ./install-docker.sh
sleep 120
ssh nom@ip -p 4222 'bash -s' < ./unami.sh

echo "Service pret a l'utilisation"