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
