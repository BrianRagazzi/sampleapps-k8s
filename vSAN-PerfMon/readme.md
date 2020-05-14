### vSAN Performance Metrics
* Inspired by vSAN Performance Monitor Fling
* https://flings.vmware.com/vsan-performance-monitor

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
kubectl apply -v vsanpm -f deploy-vsanpm.yaml
```

## Connect
locate the IP of the loadbalancer in the vsanpm namespace
```
kubectl get svc -n vsanpm grafana
```

* Point a browser at it, login as admin|admin
* Will take ~5 minutes to get data into graphs
