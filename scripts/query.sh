#!/bin/bash
# This has some standard queries for dev use.

namespace="kube-system"
if [ -n "$1" ]; then
	$namespace = "$1"
fi

usage() {
echo ""
echo './query.sh [-d | --databases] [-c | --cpu] [-k | --ksm] ["select+*+from+telegraf.."]'
echo ""
echo "'-d' | '--databases'       - Show the databases that exist in Influx."
echo "'-c' | '--cpu'             - Show all data from the 'cpu' table using 'select+*+from+telegraf..cpu'."
echo "'-k' | '--ksm'             - Show all data from the 'kube_pod_container_status_restarts_total' table."
echo "'select+some+query+string' - Show data depending on the inputted IFQL query."
echo ""
echo 'This queries the Influx database for all supplied options, predefined or otherwise.'	
}

IP=$(sudo kubectl get svc --namespace $namespace data-influxdb -o json | jq -r .spec.clusterIP)
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

