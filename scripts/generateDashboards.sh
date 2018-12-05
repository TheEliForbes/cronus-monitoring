#!/bin/bash

if ! [ -e generatedDashboards ] ; then
  echo "Directory non-existent. . ."
  mkdir generatedDashboards
else
  echo "Removing previously generated dashboards. . ."
  rm generatedDashboards/*.json
  echo "Old Dashboards Removed."
fi

declare -i counter=0
NODENAMES=$(kubectl get nodes -o jsonpath='{ .items[*].metadata.name }')

echo $'Generating Dashboards. . .\n'

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

echo "System Dashboards generated -- see ./generatedDashboards"
echo $'Copying dashboards to cronus-monitoring/charts/grafana/dashhboards/\n. . .'

cp ./generatedDashboards/*.json ../charts/grafana/dashboards/

echo "Dashboards copied to cronus-monitoring/charts/grafana/dashhboards/"
