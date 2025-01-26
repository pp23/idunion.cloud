# idunion.cloud

Deploys idunion applications to a Kubernetes cluster

## Deployment

```
tofu init
tofu plan -var env=dev -var kubeconfig=~/.kube/k3s.idunion.config -var helm_path=`which helm` -var idunion_dockerconfig_path=~/.docker/config.json -out /tmp/PLAN
tofu apply /tmp/PLAN
```
