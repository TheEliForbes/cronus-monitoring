#!/bin/bash
#This may be useful for Kapacitor debugging

namespace="kube-system"
if [ -n "$1" ]; then
	$namespace = "$1"
fi

sudo kubectl logs -f --namespace $namespace \
$(sudo kubectl get pods --namespace $namespace -l app=alerts-kapacitor -o jsonpath='{ .items[0].metadata.name }')