

https://github.com/helm/charts/tree/master/stable/minio

Pre-create PV & PVC for NFS share

Pass parsms:
* persistence.enabled=true
* persistence.existingClaim={pvcname}
* persistence.subPath (if necessary)
* service.type=LoadBalancer
* networkPolicy.allowExternal=true


kubectl apply -n minio -f minio-nfs-pvc.yaml
helm install minio --values values.yaml --namespace minio stable/minio
