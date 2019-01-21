#!/bin/bash

echo "this script may fail.."
KPODNAME=$(sudo kubectl get pods --namespace kube-system -l app=alerts-kapacitor -o jsonpath='{ .items[0].metadata.name }')
namespace="kube-system"
kubectl exec -i -t --namespace $namespace $KPODNAME /bin/sh
chmod +x /TICKscripts/defineTasks.sh;
.//TICKscripts/defineTasks.sh