

## Argo


### Add Argo repo to helm:
helm repo add argo https://argoproj.github.io/argo-helm


### Install Argo
helm install argo/argo --version 0.7.2

### Install Argo CD
helm install argo/argo-cd --version 2.0.0
