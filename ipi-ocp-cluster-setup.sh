#!/bin/bash

CLUSTER_NAME=$1
CLUSTER_ADMIN_USER=kubeadmin
CLUSTER_ADMIN_PASSWORD=`cat $CLUSTER_NAME/auth/kubeadmin-password`
CLUSTER_API_SERVER=`cat $CLUSTER_NAME/auth/kubeconfig | grep server: | awk '{print $2}' | uniq`
CLUSTER_CONSOLE_SERVER=`grep "Access the OpenShift web-console here:" $CLUSTER_NAME/.openshift_install.log | sed 's/^.*Access the OpenShift web-console here: //g' | sed 's/\"//g'`

echo "CLUSTER_NAME: $CLUSTER_NAME"
echo "CLUSTER_ADMIN_USER: $CLUSTER_ADMIN_USER"
echo "CLUSTER_ADMIN_PASSWORD: $CLUSTER_ADMIN_PASSWORD"
echo "CLUSTER_API_SERVER: $CLUSTER_API_SERVER"
echo "CLUSTER_CONSOLE_SERVER: $CLUSTER_CONSOLE_SERVER"

oc login -u $CLUSTER_ADMIN_USER -p $CLUSTER_ADMIN_PASSWORD $CLUSTER_API_SERVER

# Get Argo CD Initial Password
ARGOCD_INITIAL_ADMIN_PASSWORD=`oc get secret openshift-gitops-cluster -n openshift-gitops -ojsonpath='{.data.admin\.password}' | base64 -d`
ARGOCD_ROUTE=`oc get route openshift-gitops-server -ojsonpath=’{.spec.host}’ -n openshift-gitops`

echo "ARGOCD_INITIAL_ADMIN_PASSWORD: $ARGOCD_INITIAL_ADMIN_PASSWORD"
echo "ARGOCD_ROUTE: $ARGOCD_ROUTE"