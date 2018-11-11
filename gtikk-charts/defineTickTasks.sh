#!/bin/bash


KPODNAME=$(sudo kubectl get pods --namespace kube-system -l app=alerts-kapacitor -o jsonpath='{ .items[0].metadata.name }')
kubectl exec -i -t --namespace kube-system $KPODNAME /bin/sh
chmod +x /tmp/TICKscripts/defineTasks.sh;
.//tmp/TICKscripts/defineTasks.sh