#!/bin/bash

helm install --name metrics --namespace kube-system ./kube-state-metrics/
#export KSM_URL="http://"$(sudo kubectl get svc --namespace kube-system metrics-kube-state-metrics -o json | jq -r .spec.clusterIP)":8085/metrics"
helm install --name data --namespace kube-system ./influxdb/
#export IFDB_URL="http://"$(sudo kubectl get svc --namespace kube-system data-influxdb -o json | jq -r .spec.clusterIP)":8086"
helm install --name polling --namespace kube-system ./telegraf-s/
helm install --name hosts --namespace kube-system ./telegraf-ds/
helm install --name alerts --namespace kube-system ./kapacitor/
helm install --name dash --namespace kube-system ./grafana/
#Replace Chronograf with Grafana
#helm install --name dash --namespace tick ./chronograf/
#kubectl get svc -w --namespace tick -l app=dash-chronograf
