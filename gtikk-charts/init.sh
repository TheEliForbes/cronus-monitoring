#!/bin/bash

if ! [ -x "$(command -v helm)" ]; then
	echo "Helm is not installed."
	read -p "Do you wish to install Helm? (y/n)" yn
	case $yn in
		[Yy]* ) chmod +x installHelm.sh; sudo ./installHelm.sh;;
		[Nn]* ) exit;;
		* ) echo "Please answer y/n.";;
	esac
fi

if ! [ -x "$(command -v jq)" ]; then
	echo "JQ is not installed."
	read -p "Do you wish to install JQ? (y/n)" yn
	case $yn in
		[Yy]* ) sudo apt install jq;;
		[Nn]* ) exit;;
		* ) echo "Please answer y/n."
		
kubectl create -f rbac-config.yaml
helm init --service-account tiller 

:::::::::::::::  #15 Nops to wait for tiller to set up

read -p "Would you like to initialize the GKIT? (y/n)" yn
case $yn in
	[Yy]* ) chmod +x create.sh; sudo ./create.sh;;
	[Nn]* ) exit;;
	* ) echo "Please answer y/n.";;
esac