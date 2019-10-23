#!/usr/bin/env bash

kubectl config set-context --current --namespace=minecraft

bungeepod=$(kubectl get po --selector=run=bungeecord -o jsonpath='{.items[*].metadata.name}')
kubectl exec $bungeepod -- rcon-cli stop
kubectl delete -f mc-bungeecord.yaml

lobbypod=$(kubectl get po --selector=run=lobby -o jsonpath='{.items[*].metadata.name}')
kubectl exec $lobbypod -- rcon-cli stop
kubectl delete -f mc-lobby.yaml

mansionpod=$(kubectl get po --selector=run=mansion -o jsonpath='{.items[*].metadata.name}')
kubectl exec $mansionpod -- rcon-cli stop
kubectl delete -f mc-mansion.yaml

penguinpod=$(kubectl get po --selector=run=penguin -o jsonpath='{.items[*].metadata.name}')
kubectl exec $penguinpod -- rcon-cli stop
kubectl delete -f mc-penguin.yaml

survivepod=$(kubectl get po --selector=run=survive -o jsonpath='{.items[*].metadata.name}')
kubectl exec $survivepod -- rcon-cli stop
kubectl delete -f mc-survive.yaml

survive2pod=$(kubectl get po --selector=run=survive2 -o jsonpath='{.items[*].metadata.name}')
kubectl exec $survive2pod -- rcon-cli stop
kubectl delete -f mc-survive2.yaml
