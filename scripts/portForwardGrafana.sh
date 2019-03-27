#!/bin/bash

#This script is used to forward access to the Grafana web-app
# to an externally accessible IP/PORT combination.
namespace="kube-system"
ip="10.0.0.1" #default ip, assuming master node of skytap environment
service="dash-grafana"
externalPort="80"
grafanaPort="80"
if [[ -n "$1" ]] && [[ -n "$2" ]]; then
	$ip="$1"
    $externalPort="$2"
fi
sudo kubectl --namespace $namespace port-forward --address localhost,$ip svc/$service $externalPort:$grafanaPort