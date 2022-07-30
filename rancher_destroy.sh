#!/bin/bash

# Destroy Rancher
cd quickstart/rancher/aws

terraform destroy --auto-approve
