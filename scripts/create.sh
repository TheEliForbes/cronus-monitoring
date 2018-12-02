#!/bin/bash

helm install --name metrics --namespace kube-system ../charts/kube-state-metrics/
helm install --name data --namespace kube-system ../charts/influxdb/
helm install --name polling --namespace kube-system ../charts/telegraf-s/
helm install --name hosts --namespace kube-system ../charts/telegraf-ds/
helm install --name alerts --namespace kube-system ../charts/kapacitor/
helm install --name dash --namespace kube-system ../charts/grafana/

