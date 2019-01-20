#!/bin/bash
# This has some standard queries for dev use.
IP=$(sudo kubectl get svc --namespace kube-system data-influxdb -o json | jq -r .spec.clusterIP)
PORT=8086
URL="http://"$IP":$PORT"

for arg in "$@"
do
	case $arg in
		--databases | -d) echo "Showing Database List"; 
						  curl $URL"/query?q=show+databases";
						  shift 1;;
		--cpu | -c) echo "Showing CPU Data";
				    curl $URL"/query?q=select+*+from+telegraf..cpu";
						  shift 1;;
		--ksm | -k) echo "Showing KSM Data";
				    curl $URL"/query?q=select+*+from+telegraf..kube_pod_container_status_restarts_total";
						  shift 1;;
	    * ) curl $URL"/query?q="$arg;;
	esac
done