#!/bin/bash
IP_UMAMI="172.24.136.6"
IP_BACKEND="172.24.140.14"
IP_FRONT="172.24.138.203"

sudo apt update
sudo apt get wget tmux git -y
docker pull docker.umami.is/umami-software/umami:latest
wget https://raw.githubusercontent.com/umami-software/umami/refs/heads/master/docker-compose.yml
docker compose up -d
echo "Connection a UNAMI sur l'adresse : $IP_UMAMI:3000"