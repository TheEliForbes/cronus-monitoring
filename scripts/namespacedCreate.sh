#!/bin/bash

echo "This seems to create a problematic deployment"
read -p "Are you sure you want to continue? (y/n)" yn
case $yn in
	[Yy]* ) helm install --name metrics --tiller-namespace $1 --namespace $1 ../charts/kube-state-metrics/;
			helm install --name data --tiller-namespace $1 --namespace $1 ../charts/influxdb/;
			helm install --name polling --tiller-namespace $1 --namespace $1 --set-string config.outputs.influxdb.url="http://data-influxdb.$1:8086" ../charts/telegraf-s/;
			helm install --name hosts --tiller-namespace $1 --namespace $1 --set-string config.outputs.influxdb.url="http://data-influxdb.$1:8086" ../charts/telegraf-ds/;
			helm install --name alerts --tiller-namespace $1 --namespace $1 ../charts/kapacitor/;
			helm install --name dash --tiller-namespace $1 --namespace $1 --set-string datasources.datasources.yaml.datasources[0].url="http://data-influxdb.$1:8086" ../charts/grafana/;;
esac