#!/bin/bash

namespace="kube-system"
if [ -n "$1" ]; then
	$namespace = "$1"
fi

KURL=$(sudo kubectl get svc --namespace $namespace alerts-kapacitor -o json | jq -r .spec.clusterIP)
IURL=$(sudo kubectl get svc --namespace $namespace data-influxdb -o json | jq -r .spec.clusterIP)
echo $KURL:9092
kapacitor-unit -kapacitor http://$KURL:9092 -influxdb http://$IURL:8086 -dir ../charts/kapacitor/TICKscripts/stream -tests ../charts/kapacitor/TICKscripts/tests/all_tests.yaml