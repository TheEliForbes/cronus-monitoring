#!/bin/bash

echo "Removing previously generated dashboards. . ."
rm ./generatedDashboards/*.json
echo "Old Dashboards Removed."

declare -i counter=0
NODENAMES=$(kubectl get nodes -o jsonpath='{ .items[*].metadata.name }')

echo "Generating Dashboards. . ."
echo ""

for NODE in $NODENAMES
do
   if [ "$counter" != '0' ]; then 
      SYSNODE="$NODE-system"
      sed "s/WATCHEDNODE/$NODE/g" systemDashboardTemplate.txt > "generatedDashboards/$SYSNODE-metrics.json"
      NODEuuid=$(uuidgen)
      sed -i "s/\"uid\": \"UCRfGnBmk\"/\"uid\": \"$NODEuuid\" /g" "generatedDashboards/$SYSNODE-metrics.json"
      echo "$SYSNODE-metrics.json created"
   else 
      let "counter=counter+1"
   fi    
done

echo ""
echo "System Dashboards generated -- see ./generatedDashboards"
echo "Copying dashboards to cronus-monitoring/charts/grafana/dashhboards/"
echo ". . ."

cp ./generatedDashboards/*.json ../charts/grafana/dashboards/

echo "Dashboards copied to cronus-monitoring/charts/grafana/dashhboards/"
