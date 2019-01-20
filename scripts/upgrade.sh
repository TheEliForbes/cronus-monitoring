#!/bin/bash

components=('kube-state-metrics' 'influxdb' 'telegraf-s' 'telegraf-ds' 'kapacitor' 'grafana')
releases=('metrics' 'data' 'polling' 'hosts' 'alerts' 'dash')
namespace="kube-system"

declare -i i=0
for component in $components
do
	helm upgrade --name $releases[$i] --namespace $namespace ../charts/$components/
	let "i=i+1"
done