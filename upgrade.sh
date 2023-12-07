#!/bin/sh

# Switching to the script directory.
SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
cd $SCRIPT_DIR

# Configuring custom settings for nodes.
ansible-playbook -i ./inventory ./playbooks/hosts-custom-configuration.yaml

# Deploying Kubernetes to nodes.
cd kubespray && ansible-playbook -i ../inventory ./upgrade-cluster.yml
