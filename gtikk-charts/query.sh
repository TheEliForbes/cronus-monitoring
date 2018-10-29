#!/bin/bash

IP=$(sudo kubectl get svc --namespace kube-system data-influxdb -o json | jq -r .spec.clusterIP)
URL="http://"$IP":8086"

for opt in "$@"
do
	case $opt in
		--databases | -d) echo "Showing Database List"; 
						  curl $URL"/query?q=show+databases";
						  shift 1;;
		--cpu | -c) echo "Showing CPU Data";
				    curl $URL"/query?q=select+*+from+telegraf..cpu";
						  shift 1;;
		--ksm | -k) echo "Showing KSM Data";
				    curl $URL"/query?q=select+*+from+telegraf..kube_pod_container_status_restarts_total";
						  shift 1;;
	esac
done