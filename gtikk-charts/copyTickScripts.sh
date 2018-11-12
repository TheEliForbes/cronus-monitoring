#!/bin/bash

KPODNAME=$(sudo kubectl get pods --namespace kube-system -l app=alerts-kapacitor -o jsonpath='{ .items[0].metadata.name }')
echo $KPODNAME
echo "$(pwd)/kapacitor/TICKscripts"
echo "kube-system/$KPODNAME:/"
kubectl cp "$(pwd)/kapacitor/TICKscripts" "kube-system/$KPODNAME:/"

read -p "Auto-define all alerts? (y/n)" yn
case $yn in
	[Yy]* ) chmod +x defineTickTasks.sh;
			./defineTickTasks.sh;;
	[Nn]* ) exit;;
		* ) echo "Please answer y/n.";;
esac