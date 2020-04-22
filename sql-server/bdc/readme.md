## Pull images to local registry
 use localimages.sh


## Create cusstom config
azdata bdc config init --source kubeadm-dev-test --target local-devtest

## Update the Cutom Config to use local registry
azdata bdc config replace --config-file local-devtest/control.json --json-values "$.spec.docker.registry=harbor.pae.ragazzilab.com"
azdata bdc config replace --config-file local-devtest/control.json --json-values "$.spec.docker.repository=bdc"
azdata bdc config replace --config-file local-devtest/control.json --json-values "$.spec.docker.imageTag=latest"


## Set Environment Variables for azdata to use Docker
 export DOCKER_USERNAME=kube
 export DOCKER_PASSWORD=password
 export AZDATA_USERNAME=admin
 export AZDATA_PASSWORD=Passw0rd
 export MSSQL_IP_ADDRES=0.0.0.0
 export ACCEPT_EULA=yes

## Get Kube ready
 Update kubeconfig with a password in client-secret
 Set context to target cluster
 Make sure target cluster has a storage class set

## Deploy
 azdata bdc create --config-profile local-devtest --accept-eula yes --debug

 azdata bdc create --config-profile kubeadm-dev-test --accept-eula yes --debug

* When prompted for Storage Class, enter "vsan"
