#!/bin/bash

HOSTG=$(sudo kubectl get svc --namespace kube-system dash-grafana -o json | jq -r .spec.clusterIP)
HOSTI=$(sudo kubectl get svc --namespace kube-system data-influxdb -o json | jq -r .spec.clusterIP)
HOSTK=$(sudo kubectl get svc --namespace kube-system metrics-kube-state-metrics -o json | jq -r .spec.clusterIP)

echo "We have them surrounded. . ."
wait 1

#5 users, 25reps
siege \
http://${HOSTG}/login?username=admin&password=strongpassword \
http://${HOSTG}/dashboards 
-c 5 -r 25 

siege \
http://${HOSTI}/query?q=show+databases \
http://${HOSTI}/query?q=select+*+from+telegraf..cpu \
http://${HOSTI}/query?q=select+*+from+telegraf..kube_pod_container_status_restarts_total \
-c 5 -r 25

siege \
http://${HOSTK}/metrics \
-c 5 -r 25

echo "Siege has been completed. . ."