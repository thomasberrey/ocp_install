#!/bin/bash

CLUSTER_NAME=$1

echo "CLUSTER_NAME: $CLUSTER_NAME"

cp -R aws-install/ $CLUSTER_NAME
sed -i "s/cluster-name/${CLUSTER_NAME}/g" $CLUSTER_NAME/install-config.yaml

openshift-install create cluster --log-level debug --dir=$CLUSTER_NAME/
