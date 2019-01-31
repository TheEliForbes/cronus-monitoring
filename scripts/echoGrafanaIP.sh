#!/bin/bash

grafanaIP="http://$(sudo kubectl get svc --namespace kube-system dash-grafana -o json | jq -r .spec.clusterIP)/login"
	
case $1 in
    --start | -s) firefox $grafanaIP;;
    	       *) echo "Grafana is at $grafanaIP";;
esac