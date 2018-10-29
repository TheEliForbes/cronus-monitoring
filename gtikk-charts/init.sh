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

#kubectl create namespace tick
#kubectl create serviceaccount tiller --namespace tick
#kubectl create -f role-tiller.yaml
#kubectl create -f rolebinding-tiller.yaml
#helm init --service-account tiller --tiller-namespace tick
kubectl create -f rbac-config.yaml
helm init --service-account tiller 

echo "-----------------"
echo -n "|"
for ((i=15; i>0; i--))
do
	echo -n "#"
	sleep 2
done
echo -n "|"
echo "-----------------"

read -p "Would you like to initialize the GKIT? (y/n)" yn
case $yn in
	[Yy]* ) chmod +x create.sh; sudo ./create.sh;;
	[Nn]* ) exit;;
	* ) echo "Please answer y/n.";;
esac

if ! [ -x "$(command -v jq)" ]; then
	echo "JQ is not installed."
	read -p "Do you wish to install JQ? (y/n)" yn
	case $yn in
		[Yy]* ) sudo apt install jq;;
		[Nn]* ) exit;;
		* ) echo "Please answer y/n."
	esac
fi

echo "Done. . ."
