# Create Namespace
```
kubectl create ns openarena
```


# Create Config Maps

```
kubectl create configmap dm-maprotation1conf -n openarena --from-file conf/maprotation-DM.cfg
kubectl create configmap dm-motdconf -n openarena --from-file conf/motd-DM.cfg
kubectl create configmap server1conf -n openarena --from-file conf/server1.cfg
```


# Create Deployment
```
kubectl apply -n openarena -f deathmatch.yaml
```
