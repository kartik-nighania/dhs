#!/bin/bash

# add iam policy to the SageMaker role
# get service quota increase on-demand g5.xlarge

# Create EKS Cluster
export PATH=$PATH:$(pwd)
eksctl create cluster -f ./4_eks-cluster.yaml