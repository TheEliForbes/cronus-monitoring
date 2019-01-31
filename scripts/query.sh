#!/bin/bash
# This has some standard queries for dev use.

usage() {
echo './query.sh [-d|--databases] [-c|--cpu] [-k|--ksm] ["select+*+from+telegraf.."]'

echo "'-d' | '--databases' Shows the databases that currently exist in Influx."

echo "'-c' | '--cpu' Shows all data from the 'cpu' table using 'select+*+from+telegraf..cpu'."

echo "'-k' | '--ksm )' Shows all data from the 'kube_pod_container_status_restarts_total' table using a query similar to that used for 'cpu'."

echo "'select+some+query+string' Shows data depending on the inputted IFQL query."

echo "This queries the Influx database for all supplied options, predefined or otherwise."	
}

IP=$(sudo kubectl get svc --namespace kube-system data-influxdb -o json | jq -r .spec.clusterIP)
PORT=8086
URL="http://"$IP":$PORT"

if [ -z "$1" ]; then
	usage
	exit
fi

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

