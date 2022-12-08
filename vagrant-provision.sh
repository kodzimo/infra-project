#! /bin/bash

# General preparations
yum makecache && yum upgrade -y
yum install -y vim net-tools

# Docker installation
# curl -fsSL get.docker.com -o get-docker.sh
# sudo sh get-docker.sh

yum install -y yum-utils
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

yum install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
systemctl start docker
sleep 3

# Docker configuration
sudo usermod -aG docker vagrant
newgrp docker

sudo systemctl enable docker.service
sudo systemctl enable containerd.service

# Kind installation
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.17.0/kind-linux-amd64
chmod +x ./kind
mv ./kind /usr/bin/kind

# Kind cluster creation
kind create cluster --config /vagrant/k8s/kind-ingress-config.yaml