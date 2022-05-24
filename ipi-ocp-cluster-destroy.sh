#!/bin/bash

CLUSTER_NAME=$1

echo "CLUSTER_NAME: $CLUSTER_NAME"

openshift-install destroy cluster --log-level debug --dir=$CLUSTER_NAME/

rm -rf $CLUSTER_NAME
