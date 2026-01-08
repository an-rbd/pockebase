#!/bin/bash
IP_UMAMI="172.21.72.104"
IP_BACKEND="172.21.68.177"
IP_FRONT="172.21.69.86"
PORT_BACKEND="4242"
TMUX_SESSION="front"
PROJECT="sdv-b2b-blog-example"

echo "###########################################################################################################"
sudo apt update
sudo apt install wget tmux git -y
echo "Indstallation de NVM"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
export NVM_DIR="$HOME/.nvm"
source "$NVM_DIR/nvm.sh"
nvm install 24
nvm use 24
node -v
echo "NVM installé"
echo "Import application front-end"
git clone https://github.com/nexus9111/sdv-b2b-blog-example.git
cd "$PROJECT" || exit 1
echo "Importation terminée"
echo "Configuration du fichier .env"
echo "VITE_BACKEND_URL=http://$IP_BACKEND:$PORT_BACKEND" > .env
echo "Fichier .env configuré"
echo "Lancement de l'application front-end dans une session tmux"
tmux has-session -t $TMUX_SESSION 2>/dev/null && tmux kill-session -t $TMUX_SESSION
tmux new-session -d -s $TMUX_SESSION \
cat .env
echo "Installation de Node.js dependencies"
npm i
echo "Lancement de l'application front-end"
tmux new-session -d -s $TMUX_SESSION "npm run dev"
echo "###########################################################################################################"
echo "Installation de l'application front-end terminée"
echo "Addresse d'accée : http://$IP_FRONT:5173"