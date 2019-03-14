#!/bin/bash

namespace="kube-system"
if [ -n "$1" ]; then
	$namespace="$1"
fi

KPODNAME=$(sudo kubectl get pods --namespace $namespace -l app=alerts-kapacitor -o jsonpath='{ .items[0].metadata.name }')
namespace="kube-system"
kubectl exec -i -t --namespace $namespace $KPODNAME /bin/sh
chmod +x /TICKscripts/defineTasks.sh;
.//TICKscripts/defineTasks.sh