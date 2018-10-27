#!/bin/bash

if ! [ -x "$(command -v helm)" ]; then
	echo 'Helm is not installed.'
	read -p "Do you wish to install Helm?" yn
	case $yn in
		[Yy]* ) chmod +x installHelm.sh; sudo ./installHelm.sh;;
		[Nn]* ) exit;;
		* ) echo "Please answer yes or no.";;
	esac
fi

kubectl create -f rbac-config.yaml
helm init --service-account tiller 
:
:
:
:
:
:
:
:
:  #Nops to wait for tiller to set up
read -p "Would you like to initialize the GKIT?" yn
case $yn in
	[Yy]* ) chmod +x create.sh; sudo ./create.sh;;
	[Nn]* ) exit;;
	* ) echo "Please answer yes or no.";;
esac