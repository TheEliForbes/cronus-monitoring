#!/bin/bash

if ! [ -x generateDashboards.sh ]; then
	chmod +x generateDashboards.sh
fi
./generateDashboards.sh

components=("kube-state-metrics" "influxdb" "telegraf-s" "telegraf-ds" "kapacitor" "grafana")
releases=("metrics" "data" "polling" "hosts" "alerts" "dash")
namespace="kube-system"

if [ -n "$1" ]; then
	$namespace = "$1"
fi

for ((i=0;i<${#components[@]};++i)); do
  helm install --name "${releases[i]}" --namespace $namespace ../charts/"${components[i]}"/
done