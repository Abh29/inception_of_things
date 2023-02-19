#!/bin/bash

#create a cluster
sudo k3d cluster create dev-cluster --port 8080:80@loadbalancer --port 8888:8888@loadbalancer --port 8443:443@loadbalancer

#start the cluster
sudo k3d cluster start dev-cluster

#create spacenames
sudo kubectl create namespace gitlab

#install argocd in the cluster
sudo kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

#get password
echo "passworld for admin: "
sudo kubectl -n argocd get secrets argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d | cat && echo


#port forwarding
sudo kubectl port-forward svc/argocd-server -n argocd 8081:443 2>/dev/null &

#starting the service
sudo kubectl apply -f ../confs/application.yaml
