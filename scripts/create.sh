#!/bin/bash

if ! [ -x generateDashboards.sh ]; then
	chmod +x generateDashboards.sh
fi
./generateDashboards.sh

components=('kube-state-metrics' 'influxdb' 'telegraf-s' 'telegraf-ds' 'kapacitor' 'grafana')
releases=('metrics' 'data' 'polling' 'hosts' 'alerts' 'dash')
namespace="kube-system"

declare -i i=0
for component in $components
do
	helm install --name $releases --namespace $namespace ../charts/$components/
	let "i=i+1"
done