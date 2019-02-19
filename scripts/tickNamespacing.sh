#!/bin/bash

namespace="tick"
if [ -n "$1" ]; then
	$namespace = "$1"
fi

#this is bugged, don't try it
kubectl create namespace $namespace
kubectl create serviceaccount tiller --namespace $namespace
kubectl create -f role-tiller.yaml
kubectl create -f rolebinding-tiller.yaml
helm init --service-account tiller --tiller-namespace $namespace
chmod +x namespacedCreate.sh
./namespacedCreate.sh