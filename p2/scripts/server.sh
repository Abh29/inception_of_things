#!/bin/bash

## args: ip_address hostname node_token_path

echo "args: $1, $2, $3"

curl -sfL https://get.k3s.io | sh -s - server \
	 --cluster-init \
     --write-kubeconfig-mode "644" \
	 --tls-san "$2" \
     --node-ip "$1" \
	 --bind-address "$1" \
	 --advertise-address "$1"


bash /home/vagrant/scripts/run_app.sh



