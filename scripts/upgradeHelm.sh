#!/bin/bash

helm upgrade --name metrics --namespace kube-system ../gtikk-charts/kube-state-metrics/
helm upgrade --name data --namespace kube-system ../gtikk-charts/influxdb/
helm upgrade --name polling --namespace kube-system ../gtikk-charts/telegraf-s/
helm upgrade --name hosts --namespace kube-system ../gtikk-charts/telegraf-ds/
helm upgrade --name alerts --namespace kube-system ../gtikk-charts/kapacitor/
helm upgrade --name dash --namespace kube-system ../gtikk-charts/grafana/