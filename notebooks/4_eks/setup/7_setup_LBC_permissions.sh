#!/bin/bash

CLUSTER_NAME=k8s-ap-south-1
ACCOUNT_ID=`aws sts get-caller-identity --output text --query Account`
REGION=ap-south-1
ALB_VERSION=v2.7.2
CERT_MANAGER_VERSION=v1.12.3

curl -o iam-policy.json https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/$ALB_VERSION/docs/install/iam_policy.json

aws iam create-policy \
    --policy-name AWSLoadBalancerControllerIAMPolicy \
    --policy-document file://iam-policy.json

eksctl create iamserviceaccount \
--cluster=$CLUSTER_NAME \
--namespace=kube-system \
--name=aws-load-balancer-controller \
--attach-policy-arn=arn:aws:iam::$ACCOUNT_ID:policy/AWSLoadBalancerControllerIAMPolicy \
--override-existing-serviceaccounts \
--region $REGION \
--approve

kubectl apply --validate=false -f https://github.com/jetstack/cert-manager/releases/download/$CERT_MANAGER_VERSION/cert-manager.yaml
