#!/bin/bash
declare -i counter=0
NODENAMES=$(kubectl get nodes -o jsonpath='{ .items[*].metadata.name }')
for NODE in $NODENAMES
do
   if [ "$counter" != '0' ]; then 
      echo "counter = $counter and NODE = $NODE"
      SYSNODE="$NODE-system"
      sed "s/WATCHEDNODE/$NODE/g" systemDashboardTemplate.txt > "$SYSNODE-metrics.json"
      NODEuuid=$(uuidgen)
      sed -i "s/\"uid\": \"UCRfGnBmk\"/\"uid\": \"$NODEuuid\" /g" "$SYSNODE-metrics.json"
   else 
      let "counter=counter+1"
      echo "counter = $counter"
   fi    
done

cp *.json ../charts/grafana/dashboards/
