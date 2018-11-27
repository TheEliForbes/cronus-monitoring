#!/bin/bash

helm install --name metrics --namespace kube-system ../gtikk-charts/kube-state-metrics/
helm install --name data --namespace kube-system ../gtikk-charts/influxdb/
helm install --name polling --namespace kube-system ../gtikk-charts/telegraf-s/
helm install --name hosts --namespace kube-system ../gtikk-charts/telegraf-ds/
helm install --name alerts --namespace kube-system ../gtikk-charts/kapacitor/
helm install --name dash --namespace kube-system ../gtikk-charts/grafana/

