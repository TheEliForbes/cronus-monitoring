#!/bin/bash

NODENAMES=$(kubectl get nodes -o jsonpath='{ .items[*].metadata.name }')
for NODE in $NODENAMES
do
   if [["$NODE" - "kube-master"]] then
      SYSNODE="$NODE-system"
      sed "s/WATCHEDNODE/$NODE/g" systemDashboardTemplate.txt > "$SYSNODE-metrics.json"
      NODEuuid=$(uuidgen)
      sed -i "s/\"uid\": \"UCRfGnBmk\"/\"uid\": \"$NODEuuid\" /g" "$SYSNODE-metrics.json"
   fi
done

cp *.json ../charts/grafana/dashboards/
