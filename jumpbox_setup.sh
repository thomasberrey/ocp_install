#!/bin/bash

OCP_VERSION=4.10.14

cd /tmp

wget https://mirror.openshift.com/pub/openshift-v4/clients/ocp/$OCP_VERSION/openshift-install-linux-$OCP_VERSION.tar.gz
wget https://mirror.openshift.com/pub/openshift-v4/clients/ocp/$OCP_VERSION/openshift-client-linux-$OCP_VERSION.tar.gz
wget https://mirror.openshift.com/pub/openshift-v4/x86_64/clients/rosa/latest/rosa-linux.tar.gz
#curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

tar -xzvf openshift-install-linux-$OCP_VERSION.tar.gz
tar -xzvf openshift-client-linux-$OCP_VERSION.tar.gz
tar -xzvf rosa-linux.tar.gz

sudo cp openshift-install /usr/local/bin
sudo cp oc /usr/local/bin
sudo cp kubectl /usr/local/bin
sudo cp rosa /usr/local/bin

sudo chown root:root /usr/local/bin/openshift-install
sudo chown root:root /usr/local/bin/oc
sudo chown root:root /usr/local/bin/kubectl
sudo chown root:root /usr/local/bin/rosa

curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh

ls -lah `(which openshift-install)`
ls -lah `(which oc)`
ls -lah `(which kubectl)`
ls -lah `(which rosa)`
ls -lah `(which helm)`
