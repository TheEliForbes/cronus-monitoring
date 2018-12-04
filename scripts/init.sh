#!/bin/bash

echo "Initializing Test Software. . ."
chmod +x ../selenium/initSelenium.sh
chmod +x ../siege/initSiege.sh

./../selenium/initSelenium.sh
./../siege/initSiege.sh
echo "Test Software Initialized. . ."

if ! [ -x "$(command -v helm)" ]; then
	echo "Helm is not installed."
	read -p "Do you wish to install Helm? (y/n)" yn
	case $yn in
		[Yy]* ) chmod +x installHelm.sh; sudo ./installHelm.sh;;
		[Nn]* ) true;;
		* ) echo "Please answer y/n.";;
	esac
fi

#kubectl create namespace tick
#kubectl create serviceaccount tiller --namespace tick
#kubectl create -f role-tiller.yaml
#kubectl create -f rolebinding-tiller.yaml
#helm init --service-account tiller --tiller-namespace tick
if ! [ -x "$(command -v kubectl api-versions | grep rbac.authorization.k8s.io/v1)"]; then
	kubectl create -f rbac-config.yaml
fi
helm init --service-account tiller 
echo ""
echo "Please wait 30 seconds for Tiller to set up"
echo "------------------------------"
for ((i=30; i>0; i--))
do	
	echo -n "#"
	sleep 1
done
echo ""
echo "------------------------------"

read -p "Would you like to initialize cronus-monitoring? (y/n)" yn
case $yn in
	[Yy]* ) chmod +x create.sh; sudo ./create.sh;;
	[Nn]* ) true;;
	* ) echo "Please answer y/n.";;
esac

if ! [ -x "$(command -v jq)" ]; then
	echo "JQ is not installed."
	read -p "Do you wish to install JQ? (y/n)" yn
	case $yn in
		[Yy]* ) sudo apt install -y jq;;
		[Nn]* ) true;;
		* ) echo "Please answer y/n."
	esac
fi

read -p "Would you like to install Helm Unit-Test? (y/n)" yn
case $yn in
	[Yy]* ) helm plugin install https://github.com/lrills/helm-unittest;;
	[Nn]* ) true;;
	* ) echo "Please answer y/n.";;
esac

echo "Done. . ."