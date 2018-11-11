#!/bin/bash

helm install --name metrics --namespace kube-system ./kube-state-metrics/
read -p "Continue with remaining components? (y/n)" yn
case $yn in
	[Yy]* ) helm install --name data --namespace kube-system ./influxdb/;
			helm install --name polling --namespace kube-system ./telegraf-s/;
			helm install --name hosts --namespace kube-system ./telegraf-ds/;
			pwd
			helm install --wait --name alerts --namespace kube-system ./kapacitor/;
			helm install --name dash --namespace kube-system ./grafana/;;
[Nn]* ) exit;;
	* ) echo "Please answer y/n.";;
esac