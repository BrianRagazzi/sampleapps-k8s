
### Install

`velero install \
    --provider aws \
    --plugins velero/velero-plugin-for-aws:v1.0.0 \
    --bucket backup-mc \
    --secret-file ./credentials-velero \
    --use-volume-snapshots=false \
    --use-restic \
    --backup-location-config \
    region=minio,s3ForcePathStyle="true",s3Url=http://192.168.100.176:9000`
    `
#### Adjust Restic DaemonSet for Enterprise PKS
* `kubectl edit ds restic -n velero`
* Locate the kubelet pods hostpath and adjust it to
* `/var/vcap/data/kubelet/pods`
* confirm that the restic pods are running and not in CrashLoopBackOffve

### Upgrade to velero 1.3.2
kubectl set image deployment/velero \
    velero=velero/velero:v1.3.2 \
    --namespace velero

kubectl set image daemonset/restic \
    restic=velero/velero:v1.3.2 \
    --namespace velero


### Add vSphere Plugin
velero plugin add vsphereveleroplugin/velero-plugin-for-vsphere:1.0.0

velero snapshot-location create vsl-vsphere --provider velero.io/vsphere

### Create a Backup

`velero backup create surv1 --include-namespaces mc --ttl 6h --selector run=survive1`

### Create a Schedule
`velero schedule create surv5-hourly --ttl 72h0m0s --schedule='@every 1h' --include-namespaces mc --selector run=survive5  --include-resources '*'`

### Restore
`velero restore create --from-schedule surv4-bihourly --selector run=survive4`

### Uninstall
`kubectl delete namespace/velero clusterrolebinding/velero
kubectl delete crds -l component=velero`
