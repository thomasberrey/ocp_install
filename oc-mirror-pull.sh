#!/bin/bash

# Description of oc-mirror at https://cloud.redhat.com/blog/how-oc-mirror-will-help-you-reduce-container-management-complexity
# Download oc-mirror at https://mirror.openshift.com/pub/openshift-v4/clients/ocp/latest/

./oc-mirror --config imageset-config.yml file://output-dir
