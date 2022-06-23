#!/bin/bash

# Install Elasticsearch, Jaeger, Kiali and Service Mesh Operators
oc apply -f service-mesh-operator-resources.yml

# Create the istio-system project
oc new-project istio-system
oc project istio-system

# Create Service Mesh Control Plane
oc apply -f service-mesh-control-plane.yml
status=$?

while [ $status != 0 ]
do
  echo "Trying to create the Service Mesh Control Plane..."
  sleep 10
  oc apply -f service-mesh-control-plane.yml
  status=$?
done

# Create Service Mesh Member Roll
oc apply -f service-mesh-member-roll.yml
