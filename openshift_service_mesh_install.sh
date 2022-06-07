#!/bin/bash

# Install Elasticsearch, Jaeger, Kiali and Service Mesh Operators
oc apply -f service-mesh-operator-resources.yml

# Create Service Mesh Control Plane
oc new-project istio-system
oc apply -f service-mesh-control-plane.yml
