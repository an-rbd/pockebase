#!/bin/bash
IP_UMAMI="172.24.136.6"
IP_BACKEND="172.24.140.14"
IP_FRONT="172.24.138.203"
git clone https://github.com/an-rbd/pockebase.git


chmod +x *.sh
set -e
cd pockebase
echo "Install BACKEND"
ssh user@$IP_BACKEND -p 4222 'bash -s' < ./code/setup-pocketbase.sh
# echo "Install FRONTEND"
# ssh user@$IP_FRONT -p 4222 'bash -s' < ./code/app.sh
# echo "Install UNAMI"
# ssh user@$IP_UMAMI -p 4222 'bash -s' < ./code/install-docker.sh
# sleep 120
# ssh user@$IP_UMAMI -p 4222 'bash -s' < ./code/unami.sh
# echo "Service pret a l'utilisation"