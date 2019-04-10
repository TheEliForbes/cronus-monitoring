#!/bin/bash

namespace="kube-system"
if [ -n "$1" ]; then
	$namespace="$1"
fi

HOSTG=$(sudo kubectl get svc --namespace $namespace dash-grafana -o json | jq -r .spec.clusterIP)
HOSTI=$(sudo kubectl get svc --namespace $namespace data-influxdb -o json | jq -r .spec.clusterIP)
HOSTK=$(sudo kubectl get svc --namespace $namespace metrics-kube-state-metrics -o json | jq -r .spec.clusterIP)

echo "We have them surrounded. . ."
sleep 1

#5 users, 25reps
siege "http://$HOSTG/login?username=admin&password=strongpassword" "http://$HOSTG/dashboards" -c 5 -r 25 
sleep 1

read -p "Continue? (enter)" c
siege "http://$HOSTI/query?q=show+databases" "http://$HOSTI/query?q=select+*+from+telegraf..cpu" "http://$HOSTI/query?q=select+*+from+telegraf..kube_pod_container_status_restarts_total" -c 5 -r 25
sleep 1

read -p "Continue? (enter)" c
siege "http://$HOSTK/metrics" -c 5 -r 25
sleep 1

echo "Siege testing has been completed. . ."