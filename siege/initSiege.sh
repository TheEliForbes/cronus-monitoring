#!/bin/bash

if ! [ -x "$(command -v siege)" ]; then
	echo "Selenium is not installed."
	read -p "Do you wish to install Siege? (y/n)" yn
	case $yn in
		[Yy]* ) wget http://download.joedog.org/siege/siege-latest.tar.gz;
		        sudo tar -zxvf siege-latest.tar.gz;
				sudo rm siege-latest.tar.gz;
				cd siege-4.0.4;
                ./configure;
                make;
                sudo make install;
                siege --version;
				cd ..;
				sudo rm -r siege-4.0.4;;    	        
		[Nn]* ) true;;
		* ) echo "Please answer y/n.";;
	esac
fi

echo "Siege Initialized. . ."