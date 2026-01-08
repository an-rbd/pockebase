#!/bin/bash
IP_UMAMI="172.21.72.104"
IP_BACKEND="172.21.68.177"
IP_FRONT="172.21.69.86"
PB_USER=$(whoami)
PB_INSTALL_DIR="/usr/local/bin"
PB_DATA_DIR="/home/$PB_USER/pocketbase_data"
ADMIN_EMAIL="mail@gmail.com"
ADMIN_PASS="useruser"
TMUX_SESSION="pocketbase"

echo "###########################################################################################################"
echo "Téléchargement de Pocketbase..."
wget https://github.com/pocketbase/pocketbase/releases/download/v0.35.0/pocketbase_0.35.0_linux_amd64.zip -O pocketbase.zip
echo "Téléchargement terminé."
echo "Décompression de l'archive..."
unzip pocketbase.zip -d pocketbase
echo "Décompression terminée."
cd pocketbase
chmod +x pocketbase
echo "Création du compte administrateur..."
./pocketbase superuser create $ADMIN_EMAIL $ADMIN_PASS
echo "Compte administrateur créé avec succès."
echo "Recupération des fichier de migration..."
sudo git clone https://github.com/nexus9111/migrations-sdv-b2b/
echo "Déplacement des fichiers de migration..."
sudo mv migrations-sdv-b2b/ pb_migrations
echo "Téléchargement et déplacement terminé."
echo "Debut de la migration de la base de données..."
./pocketbase migrate
echo "Migration terminée."
echo "Lancement de la session tmux pour Pocketbase..."
tmux new-session -d -s $TMUX_SESSION ./pocketbase serve --http=$IP_BACKEND:4242
echo "###########################################################################################################"
echo "Installation de Pocketbase terminée avec succès."
echo "Indications d'accès :"
echo " - URL console : http://$IP_BACKEND:4242/_/"
echo " - URL api : http://$IP_BACKEND:4242/api/"
echo " - Nom de la session tmux : $TMUX_SESSION"