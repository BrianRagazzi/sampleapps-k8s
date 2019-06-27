kubectl create ns scratch
kubectl config set-credentials developer --username=dev --password=mypass
kubectl config set-context dev-scratch --cluster=cl1 --namespace=scratch --user=dev
