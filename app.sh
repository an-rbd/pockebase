#!/bin/bash

PORT_BACKEND="4242"
TMUX_SESSION="front"
PROJECT="sdv-b2b-blog-example"
IP_BACKEND="172.27.162.251"
IP_FRONT="172.27.175.213"

source ./auto.sh

echo "install outils"
sudo apt update
sudo apt install wget tmux git -y
echo "installation node"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
export NVM_DIR="$HOME/.nvm"
source "$NVM_DIR/nvm.sh"
nvm install 24
nvm use 24
node -v
echo "import application "
git clone https://github.com/nexus9111/sdv-b2b-blog-example.git
cd "$PROJECT" || exit 1
echo "modif .env"
echo "VITE_BACKEND_URL=http://$IP_BACKEND:$PORT_BACKEND" > .env
tmux has-session -t $TMUX_SESSION 2>/dev/null && tmux kill-session -t $TMUX_SESSION
tmux new-session -d -s $TMUX_SESSION \
cat .env
echo "install node"
npm i
echo "start node"
tmux new-session -d -s $TMUX_SESSION "npm run dev"

echo "Adresse internet : http://$IP_FRONT:5173"