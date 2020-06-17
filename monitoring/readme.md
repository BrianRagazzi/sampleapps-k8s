## Monitoring with Prometheus, Influxdb and Grafana


## telegraf.conf
The sample includes collection points for vSphere in addition to just vSAN

## grafana-datasources.conf

## Prereqs
* Create a StorageClass in the cluster
* Update the storageClassName value in the 'deploy-monitoring.yaml' file to match your sc name
* if your cluster cannot support external loadbalancers, update the 'grafana' service type from 'LoadBalancer' to 'NodePort'
* Update telegraf.conf with the correct endpoints and credentials

## Create Namespace
```
kubectl create ns monitoring
```
## Create configmap
* make sure you've updated telegraf.conf with your values
```
kubectl create configmap telegraf -n monitoring --from-file ./telegraf.conf
kubectl create configmap grafana-datasources -n monitoring --from-file ./grafana-datasources.yaml
```

## Deploy prometheus, grafana, influxdb, telegraf
```
kubectl apply -n monitoring -f 01-prometheus-config-map.yaml
kubectl apply -n monitoring -f 02-prometheus-deployment.yaml
kubectl apply -n monitoring -f 03-kube-state-metrics.yaml
kubectl apply -n monitoring -f 04-telegraf-influx.yaml
kubectl apply -n monitoring -f 05-graafana.yaml
```

## Connect
locate the IP of the loadbalancer (or NodePort) in the monitoring namespace
```
kubectl get svc -n monitoring grafana
```

* Point a browser at it, login as admin|admin
* Will take ~5 minutes to get data into graphs
