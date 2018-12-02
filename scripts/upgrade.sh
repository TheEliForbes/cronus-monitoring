#!/bin/bash
helm upgrade --name metrics --namespace kube-system ../charts/kube-state-metrics/
helm upgrade --name data --namespace kube-system ../charts/influxdb/
helm upgrade --name polling --namespace kube-system ../charts/telegraf-s/
helm upgrade --name hosts --namespace kube-system ../charts/telegraf-ds/
helm upgrade --name alerts --namespace kube-system ../charts/kapacitor/
helm upgrade --name dash --namespace kube-system ../charts/grafana/