#!/bin/bash

grafanaIP="http://$(sudo kubectl get svc --namespace kube-system dash-grafana -o json | jq -r .spec.clusterIP)/login"
	
if [ -n "$1" ]; then
	$1 $grafanaIP
else
	firefox $grafanaIP
fi
