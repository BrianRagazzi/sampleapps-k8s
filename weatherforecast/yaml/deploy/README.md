create cluster

create ns

create psp

create secret

kubectl create secret docker-registry registry-credentials --docker-server=harbor.wesleyreisz.com --docker-username=tap-ga --docker-password=** -n weatherforecast-stage

create deployment

create service

kubectl set image deployment/weatherforecast-api-deployment weatherforecast-api=harbor.wesleyreisz.com/rrsc/weatherforecast-service-api:$build_num  --kubeconfig=kubeconfig.yml --namespace=weatherforecast-stage 

