#!/bin/bash

NODENAMES=$(kubectl get nodes -o jsonpath='{ .items[*].metadata.name }')
for NODE in $NODENAMES
do
   SYSNODE="$NODE-system"
   sed "s/WATCHEDNODE/$NODE/g" systemDashboardTemplate.txt > "$SYSNODE-metrics.json"
   NODEuuid=$(uuidgen)
   sed -i "s/\"uid\": \"UCRfGnBmk\"/\"uid\": \"$NODEuuid\" /g" "$SYSNODE-metrics.json"
done

cp *.json ../charts/grafana/dashboards/
