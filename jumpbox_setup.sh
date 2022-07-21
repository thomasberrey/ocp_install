#!/bin/bash

OCP_VERSION=4.10.14

cd /tmp

wget https://mirror.openshift.com/pub/openshift-v4/clients/ocp/$OCP_VERSION/openshift-install-linux-$OCP_VERSION.tar.gz
wget https://mirror.openshift.com/pub/openshift-v4/clients/ocp/$OCP_VERSION/openshift-client-linux-$OCP_VERSION.tar.gz

tar -xzvf openshift-install-linux-$OCP_VERSION.tar.gz
tar -xzvf openshift-client-linux-$OCP_VERSION.tar.gz

sudo cp openshift-install /usr/bin
sudo cp oc /usr/bin

sudo chown root:root /usr/bin/openshift-install
sudo chown root:root /usr/bin/oc

curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh

ls -lah `(which openshift-install)`
ls -lah `(which oc)`
ls -lah `(which helm)`
