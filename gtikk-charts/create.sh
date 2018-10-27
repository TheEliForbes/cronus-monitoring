#!/bin/bash

helm install --name data --namespace kube-system ./influxdb/
helm install --name polling --namespace kube-system ./telegraf-s/
helm install --name hosts --namespace kube-system ./telegraf-ds/
helm install --name alerts --namespace kube-system ./kapacitor/
helm install --name dash --namespace kube-system ./grafana/
#Replace Chronograf with Grafana
#helm install --name dash --namespace tick ./chronograf/
#kubectl get svc -w --namespace tick -l app=dash-chronograf
