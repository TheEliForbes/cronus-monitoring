#!/bin/bash

NODENAMES=$(kubectl get nodes -o jsonpath='{ .items[*].metadata.name }')
for NODE in $NODENAMES
do
   SYSNODE="$NODE-system"
   sed "s/WATCHEDNODE/$SYSNODE/g" systemDashboardTemplate.txt > "$SYSNODE-metrics.json"
   $NODEuuid=uuidgen
   sed "s/\"uid\": \"UCRfGnBmk\"/\"uid\": \"$NODEuuid\" /g"
done

cp *.json ../charts/grafana/dashboards/
