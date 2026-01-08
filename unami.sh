#!/bin/bash

source ./var.sh

sudo apt update
sudo apt get wget tmux git -y
docker pull docker.umami.is/umami-software/umami:latest
wget https://raw.githubusercontent.com/umami-software/umami/refs/heads/master/docker-compose.yml
docker compose up -d
echo "Connection a UNAMI sur l'adresse : $IP_UMAMI:3000"