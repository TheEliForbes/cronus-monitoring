#!/bin/bash

if ! [ -x "$(command -v pip)" ]; then
	echo "Pip is not installed."
	read -p "Do you wish to install Pip? (y/n)" yn
	case $yn in
		[Yy]* ) sudo apt install -y python-pip;;
		[Nn]* ) exit;;
		* ) echo "Please answer y/n.";;
	esac
fi

if ! [ -x "$(command -v selenium)" ]; then
	echo "Selenium is not installed."
	read -p "Do you wish to install Selenium? (y/n)" yn
	case $yn in
		[Yy]* ) wget https://github.com/mozilla/geckodriver/releases/download/v0.22.0/geckodriver-v0.22.0-linux64.tar.gz;
		        sudo tar -zxvf geckodriver-v0.22.0-linux64.tar.gz;
				sudo rm geckodriver-v0.22.0-linux64.tar.gz;
				sudo mv geckodriver /usr/bin;
				pip install selenium;;		        
		[Nn]* ) exit;;
		* ) echo "Please answer y/n.";;
	esac
fi

#//This block is commented out since this is included in the initialization script.
#read -p "Would you like to auto-test Grafana? (y/n)" yn
#case $yn in
#	[Yy]* ) python login.py $(sudo kubectl get svc --namespace kube-system dash-grafana -o json | jq -r .spec.clusterIP);;
#	[Nn]* ) exit;;
#	* ) echo "Please answer y/n.";;
#esac

echo "Selenium Initialized. . ."