#!/bin/bash

CLUSTER_NAME=$1
COMPUTE_NODES=2
COMPUTE_MACHINE_TYPE=c5.xlarge

echo "CLUSTER_NAME: $CLUSTER_NAME"
echo "COMPUTE_NODES: $COMPUTE_NODES"
echo "COMPUTE_MACHINE_TYPE: $COMPUTE_MACHINE_TYPE"

rosa whoami
rosa verify quota
rosa verify openshift-client
rosa create cluster --cluster-name $CLUSTER_NAME --sts --mode auto --yes --compute-nodes $COMPUTE_NODES --compute-machine-type $COMPUTE_MACHINE_TYPE --watch
rosa describe cluster -c $CLUSTER_NAME
rosa create admin --cluster=$CLUSTER_NAME
