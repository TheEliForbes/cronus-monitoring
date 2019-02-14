#!/bin/bash

namespace="kube-system"
if [ -n "$1" ]; then
	$namespace = "$1"
fi

KPODNAME=$(sudo kubectl get pods --namespace $namespace -l app=alerts-kapacitor -o jsonpath='{ .items[0].metadata.name }')
echo $KPODNAME
echo "$(pwd)/kapacitor/TICKscripts"
echo "kube-system/$KPODNAME:/"
kubectl cp "$(pwd)/../charts/kapacitor/TICKscripts" "kube-system/$KPODNAME:/"
