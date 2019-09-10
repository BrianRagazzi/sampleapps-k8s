## Guestbook Sample App

### If using a local, private docker repo
1. Be sure your k8s workers trust the docker registry CA
1. [Add a docker-registry secret] (https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/#registry-secret-existing-credentials) *the example registry secret is named **harbor** *
1. Modify the image path in the guestbook-lb-labharbor.yaml to your registry

### Running the example
1. kubectl apply -f vsphere-sc.yml *Creates the Storage Class*
1. kubectl apply -f redis-master-claim.yml
1. kubectl apply -f redis-slave-claim.yml *Creates the pvc for the redis nodes*
1. kubectl apply -f guestbook-lb.yml
  * guestbook-lb.yml to create the deployments and load-balancer service using images from Google
  * guestbook-lb-labharbor.yml to create the deployments and load-balancer service using images from private docker repo
  * guestbook-nodeport.yml to create the deployments and a *nodeport* service using images from Google
