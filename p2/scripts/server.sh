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


kubectl apply -f /vagrant/confs/app1/conf.yaml
kubectl apply -f /vagrant/confs/app2/conf.yaml
kubectl apply -f /vagrant/confs/app3/conf.yaml

kubectl apply -f /vagrant/confs/app1/app1.yaml
kubectl apply -f /vagrant/confs/app3/app3.yaml
kubectl apply -f /vagrant/confs/app2/app2.yaml



