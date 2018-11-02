#!/bin/bash
#Clean up those pesky containers

sudo kubectl delete pod --namespace kube-system data-influxdb-service-test-db
sudo kubectl delete pod --namespace kube-system data-influxdb-service-test-tdb
sudo kubectl delete pod --namespace kube-system metrics-kube-state-metrics-service-test-metrics
sudo kubectl delete pod --namespace kube-system dash-grafana-test-web
