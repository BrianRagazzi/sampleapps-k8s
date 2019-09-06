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
* Optionally change the current-context's namespace:
** kubectl config set-context --current --namespace mediawiki
* run helm install --name mediawiki stable/mediawiki \
--set mediawikiPassword="mypassword",mediawikiName="Helm Wiki"
* run kubectl get svc to get load-balancer IP
* run kubectl get po to check that pods are running
* Optionally add DNS record for mediawiki.* to the LB address
* run helm list to see deployment
* run helm delete mediawiki to delete from kube cluster
