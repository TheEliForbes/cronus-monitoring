#!/bin/bash

helm install --name metrics --tiller-namespace tick --namespace tick ./kube-state-metrics/
read -n 1 -p "Continue..." "mainmenuinput"
helm install --name data --tiller-namespace tick --namespace tick ./influxdb/
helm install --name polling --tiller-namespace tick --namespace tick ./telegraf-s/
helm install --name hosts --tiller-namespace tick --namespace tickcreate.sh ./telegraf-ds/
helm install --name alerts --tiller-namespace tick --namespace tick ./kapacitor/
helm install --name dash --tiller-namespace tick --namespace tick ./grafana/
#Replace Chronograf with Grafana
#helm install --name dash --namespace tick ./chronograf/
#kubectl get svc -w --namespace tick -l app=dash-chronograf
