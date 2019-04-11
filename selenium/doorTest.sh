#!/bin/bash

namespace="kube-system"
if [ -n "$1" ]; then
	$namespace="$1"
fi
ip=$(sudo kubectl get svc --namespace $namespace dash-grafana -o json | jq -r .spec.clusterIP)

python login.py $ip
python dashboardTest.py $ip