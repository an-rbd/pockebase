SSH_DIR="$HOME/.ssh"
SSH_KEY="$SSH_DIR/id_rsa"

echo "=========={ Installing useful packages..."
sudo apt update > /dev/null 2>&1
sudo apt install -y vim unzip whois net-tools htop tree curl wget bpytop git tmux > /dev/null 2>&1

echo "=========={ Setup ssh server to start on boot and listen on port 4222 instead of 22..."
sudo apt install -y openssh-server > /dev/null 2>&1
sudo sed -i 's/#Port 22/Port 4222/g' /etc/ssh/sshd_config
sudo systemctl enable ssh
sudo systemctl restart ssh

echo "=========={ Enable ssh connexion without password..."
touch "$SSH_DIR/authorized_keys"
chmod 600 $SSH_DIR/authorized_keys
# sudo sed -i 's/^#PasswordAuthentication.*/PasswordAuthentication no/' /etc/ssh/sshd_config
sudo systemctl restart ssh

