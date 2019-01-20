#!/bin/bash

fullDestinationPath="cronus-monitoring/charts/grafana/generatedDashboards/"
dashGen() {
  NODE=$1
  SYSNODE="$NODE-system"
  sed "s/WATCHEDNODE/$NODE/g" systemDashboardTemplate.txt > "generatedDashboards/$SYSNODE-metrics.json"
  NODEuuid=$(uuidgen)
  sed -i "s/\"uid\": \"UCRfGnBmk\"/\"uid\": \"$NODEuuid\" /g" "generatedDashboards/$SYSNODE-metrics.json"
  echo "$SYSNODE-metrics.json created"	
}

printNodes() {
for NODE in $NODENAMES do
		if [ "$namecounter" != '0' ]; then
			echo "$namecounter. $NODE"
		fi
		let "namecounter=namecounter+1"			
done
}


if ! [ -e generatedDashboards ] ; then
  echo "Directory non-existent. . ."
  mkdir generatedDashboards
else
  read -p "Remove previous dashboards? (y/n)" yn
  case $yn in
  	[Yy]* ) echo "Removing previously generated dashboards. . .";
            rm generatedDashboards/*.json;
            echo "Old Dashboards Removed.";;
  	[Nn]* ) true;;
  	* ) true;;
  esac
  
fi

declare -i counter=0
declare -i namecounter=0
NODENAMES=$(kubectl get nodes -o jsonpath='{ .items[*].metadata.name }')
echo $'Generating Dashboards. . .\n'

if [ "$1" == "-s" ]; then
	printNodes
	read -p "Input the numbers of desired nodes in ascending order (1 2 ..)" selectedNumbers
	for NODE in $NODENAMES do
	   if [ "$counter" != '0' ]; then 
	   	  for num in $selectedNumbers do
	   	  	if [ "$num" == "$counter" ]; then
		       dashGen $NODE
		       
		       let "counter=counter+1"
		       break
	  	    fi	  	     	  
	  	  done
	   else 
	      let "counter=counter+1"
	   fi    
	done
else
	for NODE in $NODENAMES do
	   if [ "$counter" != '0' ]; then 
	      dashGen $NODE
	   else 
	      let "counter=counter+1"
	   fi    
	done
fi

echo "System Dashboards generated -- see scripts/generatedDashboards"
echo "Copying dashboards to $fullDestinationPath"
cp ./generatedDashboards/*.json ../charts/grafana/dashboards/
echo "Dashboards copied to $fullDestinationPath"
