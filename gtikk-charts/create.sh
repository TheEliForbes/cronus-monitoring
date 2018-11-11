#!/bin/bash

helm install --name metrics --namespace kube-system ./kube-state-metrics/
read -p "Continue with remaining components? (y/n)" yn
case $yn in
	[Yy]* ) helm install --name data --namespace kube-system ./influxdb/;
			helm install --name polling --namespace kube-system ./telegraf-s/;
			helm install --name hosts --namespace kube-system ./telegraf-ds/;
			
			helm install --name alerts --namespace kube-system ./kapacitor/;
			helm install --name dash --namespace kube-system ./grafana/;

			echo $(sudo kubectl get pods --namespace kube-system -l app=alerts-kapacitor -o jsonpath='{ .items[0].metadata.name }');
			sleep 10;
			kubectl cp "$(pwd)/kapacitor/TICKscripts" "kube-system/$(sudo kubectl get pods --namespace kube-system -l app=alerts-kapacitor -o jsonpath='{ .items[0].metadata.name }'):/tmp"; 
			./connectToKapacitorContainer.sh;
			chmod +x /tmp/TICKscripts/defineTasks.sh;
			.//tmp/TICKscripts/defineTasks.sh;;
[Nn]* ) exit;;
	* ) echo "Please answer y/n.";;
esac