#!/bin/bash

kubectl create namespace tick
kubectl create serviceaccount tiller --namespace tick
kubectl create -f role-tiller.yaml
kubectl create -f rolebinding-tiller.yaml
helm init --service-account tiller --tiller-namespace tick
chmod +x namespacedCreate.sh
./namespacedCreate.sh