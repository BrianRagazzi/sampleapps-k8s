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

## Prometheus

1. helm install stable/prometheus-operator --name prometheus-operator --namespace monitoring
1. kubectl expose deploy prometheus-operator-operator --port=9090 --target-port=9090 --name=prometheus --selector=app=prometheus -n monitoring --type=LoadBalancer
1. kubectl expose deploy prometheus-operator-grafana --port=3000 --target-port=3000 --name=grafana --selector=app=grafana -n monitoring --type=LoadBalancer

   admin | prom-operator
1. kubectl expose svc prometheus-operator-alertmanager --port=9093 --target-port=9093 --name=alertmanager -n monitoring --type=LoadBalancer


## Troubleshooting

1. kubectl create serviceaccount --namespace kube-system tiller
1. kubectl create clusterrolebinding tiller-cluster-rule --clusterrole=cluster-admin --serviceaccount=kube-system:tiller
1. kubectl patch deploy --namespace kube-system tiller-deploy -p '{"spec":{"template":{"spec":{"serviceAccount":"tiller"}}}}'
