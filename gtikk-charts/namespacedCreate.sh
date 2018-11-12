#!/bin/bash

helm install --name metrics --namespace kube-system ./kube-state-metrics/
helm install --name data --namespace kube-system ./influxdb/
helm install --name polling --namespace kube-system --set-string config.outputs.influxdb.url="http://data-influxdb.$1:8086" ./telegraf-s/
helm install --name hosts --namespace kube-system --set-string config.outputs.influxdb.url="http://data-influxdb.$1:8086" ./telegraf-ds/
helm install --name alerts --namespace kube-system ./kapacitor/
helm install --name dash --namespace kube-system --set-string datasources.datasources.yaml.datasources[0].url="http://data-influxdb.$1:8086" ./grafana/
