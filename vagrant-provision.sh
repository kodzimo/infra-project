#! /bin/bash

# General preparations
sudo yum makecache && yum upgrade
sudo yum install -y vim net-tools

# Docker installation
# curl -fsSL get.docker.com -o get-docker.sh
# sudo sh get-docker.sh

sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo

sudo yum install docker-ce docker-ce-cli containerd.io docker-compose-plugin
sudo systemctl start docker
sudo docker run hello-world


# Docker configuration
sudo groupadd docker
sudo usermod -aG docker vagrant
newgrp docker

sudo systemctl enable docker.service
sudo systemctl enable containerd.service

# Kind installation
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.17.0/kind-linux-amd64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind

# Kind cluster creation
kind create cluster --config /vagrant/k8s/kind-ingress-config.yaml
