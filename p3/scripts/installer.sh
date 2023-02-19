#!/bin/bash

#install and run docker
yay -S docker
sudo dockerd

#install k3d
wget -q -O - https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash

#install kubectl
sudo pacman -S kubectl

