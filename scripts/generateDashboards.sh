#!/bin/bash

fullDestinationPath="cronus-monitoring/charts/grafana/generatedDashboards/"
#yourDashGenFn() {
# -Store Node Variable from argument $1
# -Create your unique dashboard name
# -Replace host names with Node variable, write to generatedDashboards/$uniqueName-metrics.json
# -Create unique dashboard id
# -Replace UID in created file (Your original dashboard UID may vary)
# -Notify user of dashboard creation
#}
sysDashGen() {
  NODE=$1
  SYSNODE="$NODE-system"
  sed "s/WATCHEDNODE/$NODE/g" systemDashboardTemplate.txt > "generatedDashboards/$SYSNODE-metrics.json"
  NODEuuid=$(uuidgen)
  sed -i "s/\"uid\": \"UCRfGnBmk\"/\"uid\": \"$NODEuuid\" /g" "generatedDashboards/$SYSNODE-metrics.json"
  echo "$SYSNODE-metrics.json created"
}
dashGen() {
  sysDashGen $1
	#yourDashGenFn $1
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
NODENAMES=$(kubectl get nodes -o jsonpath='{ .items[*].metadata.name }')
echo $'Generating Dashboards. . .\n'

if [ "$1" == "-s" ] || [ "$1" == "--select" ]; then
	declare -i namecounter=0             ######################
    for NODE in $NODENAMES                 #                  #
    do                                     #                  #
      if [ "$namecounter" != '0' ]; then   # Print Node names #
 		echo "$namecounter. $NODE"         #                  #
	  fi                                   #                  #
	  let "namecounter=namecounter+1"	 ######################
    done
	read -p "Input the numbers of desired nodes in ascending order (1 2 ..)" selectedNumbers
	for NODE in $NODENAMES                   ###################
	do                                         # for each node
	   if [ "$counter" != '0' ]; then          # if not master
	   	  for num in $selectedNumbers          # for each selectedNumber  
	   	  do                                   #  
	   	  	if [ "$num" == "$counter" ]; then  # if nodeNumber is selected
		       dashGen $NODE                   # generate dashboard
		       let "counter=counter+1"         #
		       break                           #
	  	    fi	  	     	                   #
	  	  done                                 #
	   else                                    #
	      let "counter=counter+1"              #
       fi                                      # TODO - These loops should be swapped..
	done                                     #################
else
	for NODE in $NODENAMES           ###################
	do                                 #otherwise,
	   if [ "$counter" != '0' ]; then  #generate dashboards for all nodes
	      dashGen $NODE                #
	   else                            #
	      let "counter=counter+1"      #
	   fi                              #
	done                             ###################
fi

echo "System Dashboards generated -- see scripts/generatedDashboards"
echo "Copying dashboards to $fullDestinationPath"
cp ./generatedDashboards/*.json ../charts/grafana/dashboards/
echo "Dashboards copied to $fullDestinationPath"
