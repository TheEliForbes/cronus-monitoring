#!/bin/bash

namespace="kube-system"
if [ -n "$1" ]; then
	$namespace = "$1"
fi

grafanaIP="http://$(sudo kubectl get svc --namespace $namespace dash-grafana -o json | jq -r .spec.clusterIP)/login"

echo "Grafana is at $grafanaIP"
