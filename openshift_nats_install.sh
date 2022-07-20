#!/bin/bash

# Install NATS Server
helm repo add nats https://nats-io.github.io/k8s/helm/charts/
helm install nats nats/nats --values nats_ha_and_jetstream.yml

# kubectl exec -n nats -it deployment/nats-box -- /bin/sh -l
# nats subscribe test &
# nats publish test hi
