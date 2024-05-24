#!/bin/bash

# Install Rancher
AWS_REGION=`cat ~/.aws/credentials | grep region | sed 's/region=//g'`
AWS_ZONE="$AWS_REGION"a
INSTANCE_TYPE=t3a.medium
RANCHER_SERVER_ADMIN_PASSWORD=adminpassword

rm -rf quickstart

git clone https://github.com/rancher/quickstart

cd quickstart/rancher/aws

cp terraform.tfvars.example terraform.tfvars
sed -i "s/aws_region = .*/aws_region = \"$AWS_REGION\"/g" terraform.tfvars
sed -i "s/aws_zone = .*/aws_zone = \"$AWS_ZONE\"/g" terraform.tfvars
sed -i "s/instance_type = .*/instance_type = \"$INSTANCE_TYPE\"/g" terraform.tfvars
sed -i "s/rancher_server_admin_password = .*/rancher_server_admin_password = \"$RANCHER_SERVER_ADMIN_PASSWORD\"/g" terraform.tfvars
cat terraform.tfvars

terraform init
terraform apply --auto-approve
