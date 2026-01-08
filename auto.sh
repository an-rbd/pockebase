#!/bin/bash

set -e

echo "Install BACKEND"
ssh user@$IP_BACKEND -p 4222 'bash -s' < ./setup-pocketbase.sh

echo "Install FRONTEND"
ssh user@$IP_FRONT -p 4222 'bash -s' < ./app.sh

echo "Install UNAMI"
ssh user@$IP_FRONT -p 4222 'bash -s' < ./unami.sh

echo "Service pret a l'utilisation"