#!/bin/bash

chmod +x installHelm.sh
chmod +x create.sh

echo "Initializing Test Software. . ."
chmod +x ../selenium/initSelenium.sh
chmod +x ../siege/initSiege.sh

./../selenium/initSelenium.sh
./../siege/initSiege.sh
echo "Test Software Initialized. . ."

if ! [ -x "$(command -v helm)" ]; then
  echo "Installing Helm"
  sudo ./installHelm.sh	
fi

#TODO - Readme on how to re-namespace
# See Helm RBAC Manual for now: https://github.com/helm/helm/blob/master/docs/rbac.md
#kubectl create namespace kube-system
kubectl create serviceaccount tiller --namespace kube-system
#kubectl create -f role-tiller.yaml
#kubectl create -f rolebinding-tiller.yaml
#helm init --service-account tiller --tiller-namespace kube-system

#TODO - Determine correct condition to create Tiller RBAC Config
#if [ -z "$(kubectl api-versions | grep rbac.authorization.k8s.io/v1)" ]; then
# kubectl create -f rbac-config.yaml
# #else
# #  echo "Default RBAC Configuration already exists."
# #fi
helm init --service-account tiller 
# echo ""
# echo "Please wait 30 seconds for Tiller to set up"
# echo "------------------------------"
# for ((i=30; i>0; i--))
# do	
#   echo -n "#"
#   sleep 1
# done
# echo ""
# echo "------------------------------"

#echo "Initializing cronus-monitoring"
#sudo ./create.sh
#TODO - Remove this block after the install script is done
# Install Script - Choose between creating in the default namespace (kube-system) or custom namespace

if ! [ -x "$(command -v jq)" ]; then
  echo "JQ is not installed."
  echo "Installing JQ. . ."
  sudo apt install -y jq 	
fi

echo "Installing Helm Unit-Test. . ."
helm plugin install https://github.com/lrills/helm-unittest

echo "Done. . ."