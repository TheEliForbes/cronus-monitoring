#!/bin/bash
#Clean up those pesky containers

testPods=("metrics-kube-state-metrics-service-test-metrics" "data-influxdb-service-test-db" "data-influxdb-service-test-tdb" "dash-grafana-test-web")
namespace="kube-system"

if [ -n "$1" ]; then
	$namespace = "$1"
fi

for testPod in $testPods
do
  sudo kubectl delete pod --namespace $namespace $testPod
done