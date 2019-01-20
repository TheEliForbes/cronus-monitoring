#!/bin/bash
#Clean up those pesky containers

testPods=('data-influxdb-service-test-db' 'data-influxdb-service-test-tdb' 'metrics-kube-state-metrics-service-test-metrics' 'dash-grafana-test-web')
namespace="kube-system"

for testPod in $testPods do
  sudo kubectl delete pod --namespace $namespace $testPod
done