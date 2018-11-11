#!/bin/bash

KPODNAME=$(sudo kubectl get pods --namespace kube-system -l app=alerts-kapacitor -o jsonpath='{ .items[0].metadata.name }');
echo $KPODNAME;
echo "$(pwd)/kapacitor/TICKscripts";
echo "kube-system/$KPODNAME:/tmp";
kubectl cp "$(pwd)/kapacitor/TICKscripts" "kube-system/$KPODNAME:/tmp"; 
kubectl exec -i -t --namespace kube-system $KPODNAME /bin/sh
chmod +x /tmp/TICKscripts/defineTasks.sh;
.//tmp/TICKscripts/defineTasks.sh