#!/bin/bash

kubectl apply -f /home/vagrant/confs/app1/conf.yaml
kubectl apply -f /home/vagrant/confs/app2/conf.yaml
kubectl apply -f /home/vagrant/confs/app3/conf.yaml

kubectl apply -f /home/vagrant/confs/app1/app1.yaml
kubectl apply -f /home/vagrant/confs/app3/app3.yaml
kubectl apply -f /home/vagrant/confs/app2/app2.yaml

kubectl apply -f /home/vagrant/confs/ingress.yaml