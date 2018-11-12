#!/bin/bash

# this script probably won't work..
echo "this script probably won't work.."
KPODNAME=$(sudo kubectl get pods --namespace kube-system -l app=alerts-kapacitor -o jsonpath='{ .items[0].metadata.name }')
kubectl exec -i -t --namespace kube-system $KPODNAME /bin/sh
chmod +x /TICKscripts/defineTasks.sh;
.//TICKscripts/defineTasks.sh