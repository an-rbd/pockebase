#!/bin/bash

export IP_BACKEND="172.27.162.251"
export IP_FRONT="172.27.175.213"

set -e

echo "Install BACKEND"
ssh user@$IP_BACKEND -p 4222 'bash -s' < ./setup-pocketbase.sh

echo "Install FRONTEND"
ssh user@$IP_FRONT -p 4222 'bash -s' < ./app.sh

echo "Service pret a l'utilisation"
