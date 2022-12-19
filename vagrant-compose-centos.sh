#! /bin/bash

# CENTOS

# General preparations
yum install -y vim net-tools git wget screen
timedatectl set-timezone Europe/Minsk
# echo 20 > /proc/sys/kernel/watchdog_thresh
# chown vagrant. ~/.ssh/id_ed25519 && chmod 600 ~/.ssh/id_ed25519

# Docker installation
yum install -y yum-utils
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

yum install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
systemctl start docker
# sleep 3

# Docker configuration
usermod -aG docker vagrant
newgrp docker

systemctl enable docker.service
systemctl enable containerd.service

# ghcr login and secret encoding
runuser -l vagrant -c "CR_PAT=$(cat -e /vagrant/pat | awk \{'print$1'\})"
runuser -l vagrant -c "echo "export CR_PAT="$CR_PAT"" >> .bashrc"
runuser -l vagrant -c "export CR_PAT"
# runuser -l vagrant -c "echo ""$CR_PAT"" | docker login ghcr.io -u kodzimo --password-stdin"
# runuser -l vagrant -c 'base64 ~/.docker/config.json > ~/.docker/64.config.json'

# Docker comppose enrolling
# runuser -l vagrant -c "docker compose up -d /vagrant/compose/docker-compose.yml"

# ngrok set up
runuser -l vagrant -c "wget https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz"
runuser -l vagrant -c "tar -xvzf ngrok-v3-stable-linux-amd64.tgz"

# make dir for app data
runuser -l vagrant -c "mkdir /home/vagrant/app-data"

# docker compose autostart
runuser -l vagrant -c "echo "cd /vagrant/infra" >> .bashrc"
runuser -l vagrant -c "echo "docker compose up -d" >> .bashrc"
runuser -l vagrant -c "echo "cd ~" >> .bashrc"
