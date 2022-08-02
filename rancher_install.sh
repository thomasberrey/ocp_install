#!/bin/bash

# Install Rancher
AWS_REGION=`cat ~/.aws/config | grep region | awk '{print $3}'`
AWS_ACCESS_KEY_ID=`cat ~/.aws/credentials | grep aws_access_key_id | awk '{print $3}'`
AWS_SECRET_ACCESS_KEY=`cat ~/.aws/credentials | grep aws_secret_access_key | awk '{print $3}' | sed 's/\//\\\\\//g'`
RANCHER_SERVER_ADMIN_PASSWORD=adminpassword

rm -rf quickstart

git clone https://github.com/rancher/quickstart

cd quickstart/rancher/aws

cp terraform.tfvars.example terraform.tfvars
sed -i "s/aws_region = .*/aws_region = \"$AWS_REGION\"/g" terraform.tfvars
sed -i "s/aws_access_key = .*/aws_access_key = \"$AWS_ACCESS_KEY_ID\"/g" terraform.tfvars
sed -i "s/aws_secret_key = .*/aws_secret_key = \"$AWS_SECRET_ACCESS_KEY\"/g" terraform.tfvars
sed -i "s/rancher_server_admin_password = .*/rancher_server_admin_password = \"$RANCHER_SERVER_ADMIN_PASSWORD\"/g" terraform.tfvars
cat terraform.tfvars

terraform init
terraform apply --auto-approve
