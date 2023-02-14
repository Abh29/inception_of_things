#!/bin/bash

#install docker
yay -S docker

#install k3d
wget -q -O - https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash

#install kubectl
sudo pacman -S kubectl

#create a cluster
k3d cluster create dev-cluster --port 8080:80@loadbalancer --port 8888:8888@loadbalancer --port 8443:443@loadbalancer

#install and setup argocd
sudo pacman -S argocd


