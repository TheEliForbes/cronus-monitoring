#!/bin/bash
#Clean up those pesky containers

sudo kubectl delete pod --namespace kube-system data-influxdb-test-db
sudo kubectl delete pod --namespace kube-system data-influxdb-test-tdb
sudo kubectl delete pod --namespace kube-system metrics-kube-state-metrics-test-metrics
