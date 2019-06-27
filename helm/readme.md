## Steps ##

* Edit storageclass.yml with correct datastore name
* Apply storageClass.yml to cluster
* Edit pvc-sample.yml with correct storageclassname
* Apply pvc-sample.yml to cluster
* Observe new vmdk on datastore
* Delete pvc-sample.yml from cluster
* Apply rbac-config.yaml to cluster to create tiller Service Account
* run helm init --service-account tiller
* run helm version to confirm tiler is ready
* run helm repo update
