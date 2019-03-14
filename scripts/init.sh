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
#kubectl create namespace kube-system
kubectl create serviceaccount tiller --namespace kube-system
kubectl create clusterrolebinding --namespace kube-system --clusterrole=cluster-admin --serviceaccount=kube-system:tiller tiller-cluster-admin
#kubectl create -f role-tiller.yaml
#kubectl create -f rolebinding-tiller.yaml
#helm init --service-account tiller --tiller-namespace kube-system
#if ! [ -x "$(command -v kubectl api-versions | grep rbac.authorization.k8s.io/v1)"]; then
#  kubectl create -f rbac-config.yaml
#fi
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

echo "Initializing cronus-monitoring"
sudo ./create.sh

if ! [ -x "$(command -v jq)" ]; then
  echo "JQ is not installed."
  echo "Installing JQ. . ."
  sudo apt install -y jq 	
fi

echo "Installing Helm Unit-Test. . ."
helm plugin install https://github.com/lrills/helm-unittest

echo "Done. . ."
