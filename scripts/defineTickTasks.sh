#!/bin/bash

namespace="kube-system"
if [ -n "$1" ]; then
	$namespace="$1"
fi

KPODNAME=$(sudo kubectl get pods --namespace $namespace -l app=alerts-kapacitor -o jsonpath='{ .items[0].metadata.name }')
kubectl exec -i -t --namespace $namespace $KPODNAME /bin/sh
cd TICKscripts
chmod +x defineTasks.sh;
./defineTasks.sh