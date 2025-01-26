# Kubernetes Resources

Deploys applications to an Kubernetes cluster

## Deployment

```
tofu plan -var env=dev -var kubeconfig=~/.kube/k3s.idunion.config -var helm_path=`which helm`
```
