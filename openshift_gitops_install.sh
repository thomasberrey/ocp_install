#!/bin/bash

# Get Argo CD Initial Password
ARGOCD_INITIAL_ADMIN_PASSWORD=`oc get secret openshift-gitops-cluster -n openshift-gitops -ojsonpath='{.data.admin\.password}' | base64 -d`
ARGOCD_ROUTE=`oc get route openshift-gitops-server -ojsonpath=’{.spec.host}’ -n openshift-gitops`

echo "ARGOCD_INITIAL_ADMIN_PASSWORD: $ARGOCD_INITIAL_ADMIN_PASSWORD"
echo "ARGOCD_ROUTE: $ARGOCD_ROUTE"
