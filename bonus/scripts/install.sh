#!/bin/bash

echo "setup..."

sudo apt-get update
sudo apt-get install -y curl openssh-server ca-certificates perl
curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | sudo bash
sudo EXTERNAL_URL="http://iot.mehill.42" apt-get install gitlab-ce


