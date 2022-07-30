#!/bin/bash

OCP_VERSION=4.10.14
TERRAFORM_VERSION=`curl -s https://api.github.com/repos/hashicorp/terraform/releases/latest | grep tag_name | cut -d: -f2 | tr -d \"\,\v | awk '{$1=$1};1'`

cd /tmp

wget https://mirror.openshift.com/pub/openshift-v4/clients/ocp/$OCP_VERSION/openshift-install-linux-$OCP_VERSION.tar.gz
wget https://mirror.openshift.com/pub/openshift-v4/clients/ocp/$OCP_VERSION/openshift-client-linux-$OCP_VERSION.tar.gz
wget https://mirror.openshift.com/pub/openshift-v4/x86_64/clients/rosa/latest/rosa-linux.tar.gz
wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip

tar -xzvf openshift-install-linux-$OCP_VERSION.tar.gz
tar -xzvf openshift-client-linux-$OCP_VERSION.tar.gz
tar -xzvf rosa-linux.tar.gz
unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip

sudo cp openshift-install /usr/local/bin
sudo cp oc /usr/local/bin
sudo cp kubectl /usr/local/bin
sudo cp rosa /usr/local/bin
sudo cp terraform /usr/local/bin

sudo chown root:root /usr/local/bin/openshift-install
sudo chown root:root /usr/local/bin/oc
sudo chown root:root /usr/local/bin/kubectl
sudo chown root:root /usr/local/bin/rosa
sudo chown root:root /usr/local/bin/terraform

curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh

ls -lah `(which openshift-install)`
ls -lah `(which oc)`
ls -lah `(which kubectl)`
ls -lah `(which rosa)`
ls -lah `(which helm)`
ls -lah `(which terraform)`
