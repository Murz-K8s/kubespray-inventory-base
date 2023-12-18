# Useful howto instructions, related to cluster management

## How to see all allowed domains in the cluster certificate

```
kubectl -n kube-system get configmap kubeadm-config -o jsonpath='{.data.ClusterConfiguration}' | yq .apiServer.certSANs
```
