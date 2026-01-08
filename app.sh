IP_BACKEND="172.27.162.251"
PORT_BACKEND="4242"
TMUX_SESSION="front"

sudo apt install wget tmux git -y
curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
source ~/.bashrc
nvm install 24
nvm use 24
nvm alias default 24
node -v
git clone https://github.com/nexus9111/sdv-b2b-blog-example.git
echo "VITE_BACKEND_URL=http://$IP_BACKEND:$PORT_BACKEND" > .env
npm i
tmux new-session -d -s $TMUX_SESSION npm run dev
