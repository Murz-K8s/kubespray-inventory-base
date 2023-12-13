# Kubespray inventory minimal base template

This is a template with minimal amount of inventory files, that are required to
deploy a Kubernetes cluster.

Actually you don't need to manage a lot of files, if you need just a default
setup of the Kubernetes cluster!

**Yes, you really don't need to copy the whole
[kubespray/inventory/sample](https://github.com/kubernetes-sigs/kubespray/tree/master/inventory/sample)
directory with 32 files containing 2000+ lines to describe your cluster!**

**Only two files with around 5 custom lines are quite enough:**

1. `inventory/hosts.yaml` to describe access to your nodes.

2. `inventory/group_vars/all.yaml` to set the cluster name and valid domains for
   the certificate.

Also, you can enable and configure any additional settings of the Kubespray
configuration in the same `all.yaml` file, managing in your local git repo only
values, that were really changed from defaults.

So, just clone this repo, set the nodes info and your cluster name by modifying
a couple of strings, and that's it!

The `Kubespray` is built in via a git submodule, so run the
`git submodule update --init --remote --recursive` to download it into your
local directory, and switch it to the desired release version.

## Quick start

1. Clone this repository:
   ```
   git clone https://github.com/Murz-K8s/kubespray-inventory-base.git mycluster
   cd mycluster
   ```

2. Copy the `inventory.sample` directory to the `inventory`:
   ```
   cp -r inventory.sample inventory
   ```

3. Inspect all files in the `inventory` directory, read comments and fill
   values, related to your cluster.

4. Check the deployment:
   ```
   ./check.sh
   ```
   You should have [ansible](https://www.ansible.com/) installed on your system.

5. Create the cluster:
   ```
   ./deploy.sh
   ```
6. Launch the script to download Kubernetes config file, which you can use
   for remote access to your  cluster:
   ```
   ./get-cluster-config.sh
   ```
   It will create the `cluster-access.yaml` file in your directory. *Keep it
   in secure place!*

7. Upgrade the cluster after making changes in future:
   ```
   ./upgrade.sh
   ```


## Host linux system configuration on nodes

Additionally, there is a `playbooks/hosts-custom-configuration.yaml` ansible
playbook file where you can configure which additional packages you want to
install on your nodes. By default they are `htop` and `net-tools`.


## Heper scripts

- `check.sh` - checks the deployment without making changes, using `--check`
  argument for Ansible and Kubespray.

- `deploy.sh` - applies the cluster deployment to the target nodes.

- `upgrade.sh` - upgrages the cluster deployment on the target nodes.

- `get-cluster-config.sh` - downloads the cluster configuration from your nodes
to the local `cluster-access.yaml` file. ***Warning!** It contains the full
access to your cluster, do not upload it to any git repository or any other
public place, keep it in a safe secure place!*
