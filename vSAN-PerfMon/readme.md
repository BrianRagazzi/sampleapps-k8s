### vSAN Performance Metrics
* Inspired by vSAN Performance Monitor Fling
* https://flings.vmware.com/vsan-performance-monitor


## Prereqs
* Create a StorageClass in the cluster
* Update the storageClassName value in the 'deploy-vsanpm.yaml' file to match your sc name
* if your cluster cannot support external loadbalancers, update the 'grafana' service type from 'LoadBalancer' to 'NodePort'

## Create Namespace
```
kubectl create ns vsanpm
```
## Create configmap
```
kubectl create configmap telegraf -n vsanpm --from-file ./telegraf.conf
```

## Deploy grafana, influxdb, telegraf
```
kubectl apply -n vsanpm -f deploy-vsanpm.yaml
```

## Connect
locate the IP of the loadbalancer (or NodePort) in the vsanpm namespace
```
kubectl get svc -n vsanpm grafana
```

* Point a browser at it, login as admin|admin
* Will take ~5 minutes to get data into graphs
