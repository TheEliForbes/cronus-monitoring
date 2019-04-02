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

#TODO - Determine correct condition to create Tiller RBAC Config
#if [ -z "$(kubectl api-versions | grep rbac.authorization.k8s.io/v1)" ]; then
#kubectl create -f rbac-config.yaml
#else
#  echo "Default RBAC Configuration already exists."

if ! [ -x "$(command -v jq)" ]; then
  echo "JQ is not installed."
  echo "Installing JQ. . ."
  sudo apt install -y jq 	
fi

echo "Installing Helm Unit-Test. . ."
helm plugin install https://github.com/lrills/helm-unittest

echo "Done. . ."
