#!/bin/bash

helm install --name metrics --tiller-namespace $1 --namespace $1 ./kube-state-metrics/
helm install --name data --tiller-namespace $1 --namespace $1 ./influxdb/
helm install --name polling --tiller-namespace $1 --namespace $1 --set-string config.outputs.influxdb.url="http://data-influxdb.$1:8086" ./telegraf-s/
helm install --name hosts --tiller-namespace $1 --namespace $1 --set-string config.outputs.influxdb.url="http://data-influxdb.$1:8086" ./telegraf-ds/
helm install --name alerts --tiller-namespace $1 --namespace $1 ./kapacitor/
helm install --name dash --tiller-namespace $1 --namespace $1 --set-string datasources.datasources.yaml.datasources[0].url="http://data-influxdb.$1:8086" ./grafana/
