#!/bin/bash

#create a cluster
k3d cluster create dev-cluster --port 8080:80@loadbalancer --port 8888:8888@loadbalancer --port 8443:443@loadbalancer

#start the cluster
k3d cluster start dev-cluster

#create spacenames
kubectl create namespace argocd
kubectl create namespace dev

#install argocd in the cluster
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

#port forwarding
kubectl port-forward svc/argocd-server -n argocd 8081:443 2>/dev/null &

#get password
echo "passworld for admin: "
kubectl -n argocd get secrets argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d | cat && echo




