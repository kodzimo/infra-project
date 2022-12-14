#! /bin/bash

# runuser -l  vagrant -c 'helm repo add jenkinsci https://charts.jenkins.io'
# runuser -l  vagrant -c 'helm repo update'
runuser -l  vagrant -c 'docker exec kind-control-plane mkdir -p /data/jenkins-volume'
runuser -l  vagrant -c 'kubectl create namespace devops-tools'
# runuser -l  vagrant -c 'kubectl create namespace devops-tools'
runuser -l  vagrant -c 'kubectl apply -f /vagrant/k8s/devops-tools/jenkins.yaml'
# runuser -l  vagrant -c 'kubectl apply -f /vagrant/k8s/devops-tools/jenkins-ingress.yaml'
# runuser -l  vagrant -c 'kubectl apply -f /vagrant/k8s/devops-tools/jenkins-values.yaml'
# runuser -l  vagrant -c 'helm install jenkins -n devops-tools -f /vagrant/k8s/devops-tools/jenkins-values.yaml jenkinsci/jenkins'

