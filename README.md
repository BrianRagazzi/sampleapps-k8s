# sampleapps-k8s
Sample Applications for PKS &amp; Kubernetes


These are just aggregated from other sources


# Use local harbor

kubectl create secret docker-registry harbor \
--docker-username=<username> \
--docker-password=<PASSWORD> \
--docker-email=<user>@<domain> \
--docker-server=<harbor fqdn> \
--namespace=<namespace>
