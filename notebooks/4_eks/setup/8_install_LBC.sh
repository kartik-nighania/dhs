#!/bin/bash

wget https://github.com/kubernetes-sigs/aws-load-balancer-controller/releases/download/v2.7.2/v2_7_2_full.yaml --no-check-certificate

# Add cluster name to file --cluster-name=k8s-ap-south-1
# Delete the service account from the yaml spec: kind: ServiceAccount
kubectl apply -f v2_7_2_full.yaml

wget https://github.com/kubernetes-sigs/aws-load-balancer-controller/releases/download/v2.7.2/v2_7_2_ingclass.yaml --no-check-certificate
kubectl apply -f v2_7_2_ingclass.yaml