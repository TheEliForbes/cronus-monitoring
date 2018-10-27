#!/bin/bash

IP=(sudo kubectl get svc --namespace kube-system metrics-kube-state-metrics -o json | jq -r .spec.clusterIP)
URL="http://"$IP":8086"

echo "Showing Database List"
curl $URL"/query?q=show+databases"

echo "Showing CPU Data"
curl $URL"/query?q=select+*+from+telegraf..cpu"
