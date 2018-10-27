#!/bin/bash

helm install --name metrics --namespace kube-system ./kube-state-metrics/
read -n 1 -p "Continue..." "mainmenuinput"
#export KSM_URL="http://"$(sudo kubectl get svc --namespace kube-system metrics-kube-state-metrics -o json | jq -r .spec.clusterIP)":8085/metrics"
helm install --name data --namespace kube-system ./influxdb/
read -n 1 -p "Continue..." "mainmenuinput"
#export IFDB_URL="http://"$(sudo kubectl get svc --namespace kube-system data-influxdb -o json | jq -r .spec.clusterIP)":8086"
helm install --name polling --namespace kube-system ./telegraf-s/
read -n 1 -p "Continue..." "mainmenuinput"
helm install --name hosts --namespace kube-system ./telegraf-ds/
read -n 1 -p "Continue..." "mainmenuinput"
helm install --name alerts --namespace kube-system ./kapacitor/
read -n 1 -p "Continue..." "mainmenuinput"
helm install --name dash --namespace kube-system ./grafana/
#Replace Chronograf with Grafana
#helm install --name dash --namespace tick ./chronograf/
#kubectl get svc -w --namespace tick -l app=dash-chronograf
