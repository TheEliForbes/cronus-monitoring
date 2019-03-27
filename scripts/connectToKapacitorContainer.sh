#!/bin/bash

namespace="kube-system"
if [ -n "$1" ]; then
	$namespace="$1"
fi

sudo kubectl exec -i -t --namespace $namespace \
$(sudo kubectl get pods --namespace $namespace -l app=alerts-kapacitor -o jsonpath='{ .items[0].metadata.name }') \
/bin/sh