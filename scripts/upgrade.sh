#!/bin/bash

components=('kube-state-metrics' 'influxdb' 'telegraf-s' 'telegraf-ds' 'kapacitor' 'grafana')
releases=('metrics' 'data' 'polling' 'hosts' 'alerts' 'dash')
namespace="kube-system"

for ((i=0;i<${#components[@]};++i)); do
  helm upgrade --name "${releases[i]}" --namespace $namespace ../charts/"${components[i]}"/
done