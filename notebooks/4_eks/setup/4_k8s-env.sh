#!/bin/bash

# Create EKS Cluster
eksctl create cluster -f ./3_eks-cluster.yaml

# Connect to our K8s
echo "Connecting to workshop-k8s-cluster Kubernetes cluster"
aws eks update-kubeconfig --region ap-south-1 --name workshop-k8s-cluster
kubectl config set-context --current --namespace=prod


echo "Testing kubectl commands"
echo "access to prod namespace: `kubectl auth can-i -n prod create pods`"
echo "access to dev  namespace: `kubectl auth can-i -n dev create pods`"
eksctl get nodegroup --cluster workshop-k8s-cluster