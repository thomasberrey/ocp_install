#!/bin/bash

# Install Rancher
AWS_REGION=`cat ~/.aws/config | grep region | awk '{print $3}'`
RANCHER_SERVER_ADMIN_PASSWORD=adminpassword

rm -rf quickstart

git clone https://github.com/rancher/quickstart

cd quickstart/rancher/aws

cp terraform.tfvars.example terraform.tfvars
sed -i "s/aws_region = .*/aws_region = \"$AWS_REGION\"/g" terraform.tfvars
sed -i "s/rancher_server_admin_password = .*/rancher_server_admin_password = \"$RANCHER_SERVER_ADMIN_PASSWORD\"/g" terraform.tfvars
cat terraform.tfvars

terraform init
terraform apply --auto-approve
