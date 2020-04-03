## Install


kubectl apply -f https://projectcontour.io/quickstart/contour.yaml

## Get info

kubectl -n projectcontour get deployments,pods,svc


## test App

kubectl apply -f https://projectcontour.io/examples/kuard.yaml
