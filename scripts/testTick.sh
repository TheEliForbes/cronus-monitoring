#!/bin/bash
URL=$(sudo kubectl get pods --namespace kube-system -l app=alerts-kapacitor -o jsonpath='{ .spec.clusterIP }')
echo $URL:9092
kapacitor-unit -kapacitor http://$URL:9092 -dir ../gtikk-charts/kapacitor/TICKscripts/stream -tests ../gtikk-charts/kapacitor/TICKscripts/tests/podstatus_test.yaml