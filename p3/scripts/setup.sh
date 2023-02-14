#!/bin/bash

#start the cluster
#k3d cluster start dev-cluster

#create spacenames
kubectl create namespace argocd
kubectl create namespace dev

#install argocd in the cluster
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

#port forwarding
kubectl port-forward svc/argocd-server -n argocd 8081:443 &

#get password
kubectl -n argocd get secrets argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d | cat && echo




