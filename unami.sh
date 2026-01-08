#!/bin/bash
IP_UMAMI="172.21.72.104"
IP_BACKEND="172.21.68.177"
IP_FRONT="172.21.69.86"

echo "###########################################################################################################"
sudo apt update
sudo apt get wget tmux git -y
echo "Installation de Unami"
docker pull docker.umami.is/umami-software/umami:latest
echo "Installation terminée"
echo "Téléchargement du fichier de configuration Docker Compose"
wget https://raw.githubusercontent.com/umami-software/umami/refs/heads/master/docker-compose.yml
echo "Lancement de Umami avec Docker Compose"
docker compose up -d
echo "###########################################################################################################"
echo "Installation de Unami terminée"
echo "Connection a UNAMI sur l'adresse : $IP_UMAMI:3000"