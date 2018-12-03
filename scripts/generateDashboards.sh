#!/bin/bash
declare -i counter=0
NODENAMES=$(kubectl get nodes -o jsonpath='{ .items[*].metadata.name }')

echo "Generating Dashboards. . ."

for NODE in $NODENAMES
do
   if [ "$counter" != '0' ]; then 
      SYSNODE="$NODE-system"
      sed "s/WATCHEDNODE/$NODE/g" systemDashboardTemplate.txt > "$SYSNODE-metrics.json"
      NODEuuid=$(uuidgen)
      sed -i "s/\"uid\": \"UCRfGnBmk\"/\"uid\": \"$NODEuuid\" /g" "$SYSNODE-metrics.json"
      echo "$SYSNODE-metrics.json created"
   else 
      let "counter=counter+1"
   fi    
done

echo "System Dashboards generated. . ."
echo "Copying dashboards to cronus-monitoring/charts/grafana/dashhboards. . ."

cp *.json ../charts/grafana/dashboards/

echo "Dashboards copied. . ."
