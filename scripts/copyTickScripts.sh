#!/bin/bash

KPODNAME=$(sudo kubectl get pods --namespace kube-system -l app=alerts-kapacitor -o jsonpath='{ .items[0].metadata.name }')
echo $KPODNAME
echo "$(pwd)/kapacitor/TICKscripts"
echo "kube-system/$KPODNAME:/"
kubectl cp "$(pwd)/../charts/kapacitor/TICKscripts" "kube-system/$KPODNAME:/"
