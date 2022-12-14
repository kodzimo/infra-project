#! /bin/bash

# General preparations
yum install -y vim net-tools git
timedatectl set-timezone Europe/Minsk
echo 20 > /proc/sys/kernel/watchdog_thresh
# chown vagrant. ~/.ssh/id_ed25519 && chmod 600 ~/.ssh/id_ed25519

# ghcr login and secret encoding
runuser -l vagrant -c "CR_PAT=$(cat /vagrant/pat)"
runuser -l vagrant -c "echo ""export CR_PAT=$CR_PAT"" >> .bashrc"
runuser -l vagrant -c "export CR_PAT"
runuser -l vagrant -c "echo ""$CR_PAT"" | docker login ghcr.io -u kodzimo --password-stdin"
# runuser -l vagrant -c 'base64 ~/.docker/config.json > ~/.docker/64.config.json'


# Docker installation
yum install -y yum-utils
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

yum install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
systemctl start docker
sleep 3

# Docker configuration
usermod -aG docker vagrant
newgrp docker

systemctl enable docker.service
systemctl enable containerd.service

# kubectl installation
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
install -o root -g root -m 0755 kubectl /usr/bin/kubectl
rm -f /home/vagrant/kubectl

yum install -y bash-completion
echo "source /usr/share/bash-completion/bash_completion" >> ~/.bashrc

# shellcheck source=/dev/null
source /usr/share/bash-completion/bash_completion
echo 'source <(kubectl completion bash)' >> ~/.bashrc

# Kind installation
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.17.0/kind-linux-amd64
chmod +x ./kind
mv ./kind /usr/bin/kind

# Kind cluster creation with ingress
runuser -l vagrant -c 'kind create cluster --config /vagrant/k8s/kind-ingress-config.yaml'
runuser -l vagrant -c 'kubectl cluster-info --context kind-kind'
runuser -l vagrant -c 'kubectl create secret generic dockerconfigjson --from-file=.dockerconfigjson=/home/vagrant/.docker/config.json --type=kubernetes.io/dockerconfigjson -n devops-tools'
# runuser -l vagrant -c 'kubectl apply -f /vagrant/k8s/devops-tools/secret.yaml'
runuser -l vagrant -c 'kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml'


# Helm installation
runuser -l vagrant -c 'curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3'
runuser -l vagrant -c 'chmod 700 get_helm.sh'
runuser -l vagrant -c './get_helm.sh'
sleep 5
rm -f ./get_helm.sh
