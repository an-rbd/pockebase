#!/bin/bash
IP_UMAMI="172.21.72.104"
IP_BACKEND="172.21.68.177"
IP_FRONT="172.21.69.86"

chmod +x *.sh
set -e
echo "###########################################################################################################"
echo "#########################################  SETUP  BACKEND  ################################################"
echo "###########################################################################################################"
echo "Début de l'instalation de Pocketbase sur la machine Backend"
ssh user@$IP_BACKEND -p 4222 'bash -s' < ./setup-pocketbase.sh
echo "Ne pas éteindre la machine. Pocketbase est en cours d'exécution en arrière-plan via tmux."
echo "###########################################################################################################"
echo "#########################################  SETUP FRONTEND  ################################################"
echo "###########################################################################################################"
echo "Début de l'installation de Node.Js sur la machine Frontend"
ssh user@$IP_FRONT -p 4222 'bash -s' < ./app.sh
echo "L'application Frontend est en cours d'exécution en arrière-plan via tmux."
echo "###########################################################################################################"
echo "#########################################  INSTALL DOCKER  #################################################"
echo "###########################################################################################################"
echo "Début de l'installation de Docker sur la machine Umami"
ssh user@$IP_UMAMI -p 4222 'bash -s' < ./install-docker.sh
echo "Redémarrage de la machine Umami pour prise en compte de l'installation de Docker..."
echo "Temps restant : 2:00 minutes"
sleep 1m
echo "Temps restant : 1:00 minutes"
sleep 30s
echo "Temps restant : 0:30 minutes"
sleep 20s
echo "Temps restant : 0:10 minutes"
sleep 10s
echo "Redémarrage terminé."
echo "###########################################################################################################"
echo "#########################################  SETUP  UMAMI  ##################################################"
echo "###########################################################################################################"
echo "Début de l'installation de l'application Umami..."
ssh user@$IP_UMAMI -p 4222 'bash -s' < ./unami.sh
echo "L'application Frontend est en cours d'exécution en arrière-plan via tmux."
echo "###########################################################################################################"
echo "Deploiement terminé !"
echo "Accéder à Umami via l'adresse : http://$IP_UMAMI:3000"
echo "Accéder à Pocketbase via l'adresse : http://$IP_BACKEND:4242/_/"
echo "Accéder à l'application Frontend via l'adresse : http://$IP_FRONT:5173"