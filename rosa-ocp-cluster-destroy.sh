#!/bin/bash

CLUSTER_NAME=$1

echo "CLUSTER_NAME: $CLUSTER_NAME"

rosa delete cluster --cluster=$CLUSTER_NAME -y --watch
rosa describe cluster -c $CLUSTER_NAME
