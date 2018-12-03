#!/bin/bash
declare -i counter=0
NODENAMES=$(kubectl get nodes -o jsonpath='{ .items[*].metadata.name }')

echo "Generating Dashboards. . ."
echo ""

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

echo ""
echo "System Dashboards generated"
echo "Copying dashboards to cronus-monitoring/charts/grafana/dashhboards/"
echo ". . ."

cp *.json ../charts/grafana/dashboards/

echo "Dashboards copied to cronus-monitoring/charts/grafana/dashhboards/"
