#!/bin/bash

OCP_VERSION=4.10.14

mkdir temp
cd temp

wget https://mirror.openshift.com/pub/openshift-v4/clients/ocp/$OCP_VERSION/openshift-install-linux-$OCP_VERSION.tar.gz
wget https://mirror.openshift.com/pub/openshift-v4/clients/ocp/$OCP_VERSION/openshift-client-linux-$OCP_VERSION.tar.gz

tar -xzvf openshift-install-linux-$OCP_VERSION.tar.gz
tar -xzvf openshift-client-linux-$OCP_VERSION.tar.gz

sudo cp openshift-install /usr/bin
sudo cp oc /usr/bin

sudo chown root:root /usr/bin/openshift-install
sudo chown root:root /usr/bin/oc

ls -lah `(which openshift-install)`
ls -lah `(which oc)`
