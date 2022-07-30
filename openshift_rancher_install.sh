#!/bin/bash

# Install Rancher
RANCHER_URL=`grep "Access the OpenShift web-console here:" imis/.openshift_install.log | sed 's/^.*Access the OpenShift web-console here: //g' | sed 's/\"//g' | sed 's/console-openshift-console/rancher/g' | sed 's/https:\/\///g'`

helm repo add rancher-latest https://releases.rancher.com/server-charts/latest

oc new-project rancher

kubectl apply -f https://github.com/jetstack/cert-manager/releases/download/v1.5.1/cert-manager.crds.yaml
helm repo add jetstack https://charts.jetstack.io
helm repo update
helm install cert-manager jetstack/cert-manager \
  --namespace cert-manager \
  --create-namespace \
  --version v1.5.1

helm install rancher rancher-latest/rancher \
  --namespace rancher \
  --set hostname=$RANCHER_URL \
  --set replicas=3
