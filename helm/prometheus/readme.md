# Install chart

k create ns monitoring
helm install prometheus stable/prometheus  --namespace monitoring

#Expose Service (LoadBalancer)

kubectl expose -n monitoring deploy prometheus-server --name=prom-lb --port=80 --target-port=9090 --selector="app=prometheus,component=server" --type=LoadBalancer

#Expose Service (NodePort)
kubectl expose -n monitoring deploy prometheus-server --name=prom-np --port=80 --target-port=9090 --selector="app=prometheus,component=server" --type=NodePort
