#!/bin/bash

helm upgrade --name metrics --namespace kube-system ./kube-state-metrics/
helm upgrade --name data --namespace kube-system ./influxdb/
helm upgrade --name polling --namespace kube-system ./telegraf-s/
helm upgrade --name hosts --namespace kube-system ./telegraf-ds/
helm upgrade --name alerts --namespace kube-system ./kapacitor/
helm upgrade --name dash --namespace kube-system ./grafana/