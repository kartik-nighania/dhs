#!/bin/bash

CLUSTER_NAME=k8s-ap-south-1

# Connect to our K8s
echo "Connecting to workshop-k8s-cluster Kubernetes cluster"
aws eks update-kubeconfig --region ap-south-1 --name $CLUSTER_NAME

kubectl create namespace prod
kubectl config set-context --current --namespace=prod


echo "Testing kubectl commands"
echo "access to prod namespace: `kubectl auth can-i -n prod create pods`"
eksctl get nodegroup --cluster $CLUSTER_NAME

# eksctl scale nodegroup --cluster k8s-ap-south-1 --nodes=0 g5-gpu-1x-ng