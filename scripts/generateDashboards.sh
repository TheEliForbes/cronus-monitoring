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
declare -i namecounter=0
NODENAMES=$(kubectl get nodes -o jsonpath='{ .items[*].metadata.name }')
	
if [ $1 == "-s" ]; then
	for NODE in $NODENAMES
	do
		if [ "$namecounter" != '0' ]; then
			echo "$namecounter. $NODE"
		fi
		let "namecounter=namecounter+1"			
	done
	
	read -p "Input the numbers of desired nodes in ascending order (1 2 ..)" nums
fi

echo $'Generating Dashboards. . .\n'

if [ $1 == "-s" ]; then
	for NODE in $NODENAMES
	do
	   if [ "$counter" != '0' ]; then 
	   	  for num in $nums
	   	  do
	   	  	echo "$num"
	   	  	if [ "$num" == "$counter" ]; then
		       SYSNODE="$NODE-system"
	      	   sed "s/WATCHEDNODE/$NODE/g" systemDashboardTemplate.txt > "generatedDashboards/$SYSNODE-metrics.json"
	      	   NODEuuid=$(uuidgen)
	    	   sed -i "s/\"uid\": \"UCRfGnBmk\"/\"uid\": \"$NODEuuid\" /g" "generatedDashboards/$SYSNODE-metrics.json"
		       echo "$SYSNODE-metrics.json created"
	  	 	fi
	   else 
	      let "counter=counter+1"
	   fi    
	done
else
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
fi

echo "System Dashboards generated -- see ./generatedDashboards"
echo $'Copying dashboards to cronus-monitoring/charts/grafana/dashhboards/\n. . .'

cp ./generatedDashboards/*.json ../charts/grafana/dashboards/

echo "Dashboards copied to cronus-monitoring/charts/grafana/dashhboards/"
