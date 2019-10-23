#!/usr/bin/env bash

kubectl config set-context --current --namespace=minecraft


kubectl create -f mc-bungeecord.yaml

kubectl create -f mc-lobby.yaml

kubectl create -f mc-mansion.yaml

kubectl create -f mc-penguin.yaml

kubectl create -f mc-survive.yaml

kubectl create -f mc-survive2.yaml
