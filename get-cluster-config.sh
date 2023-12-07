#!/bin/sh

# Switching to the script directory.
SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
cd $SCRIPT_DIR

# Downloading the cluster config file.
ansible-playbook -i ./inventory ./playbooks/download-cluster-config.yaml
