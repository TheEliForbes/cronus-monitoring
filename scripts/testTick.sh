#!/bin/bash
URL=$(sudo kubectl get svc --namespace kube-system alerts-kapacitor -o json | jq -r .spec.clusterIP)
echo $URL:9092
kapacitor-unit -kapacitor http://$URL:9092 -dir ../gtikk-charts/kapacitor/TICKscripts/stream -tests ../gtikk-charts/kapacitor/TICKscripts/tests/*.yaml