#!/bin/bash

if ! [ -x "$(command -v pip)" ]; then
	echo "Installing Pip. . ."
	sudo apt install -y python-pip;;
fi

if ! [ -x "$(command -v selenium)" ]; then
	echo "Installing Selenium. . ."
	wget https://github.com/mozilla/geckodriver/releases/download/v0.22.0/geckodriver-v0.22.0-linux64.tar.gz
    sudo tar -zxvf geckodriver-v0.22.0-linux64.tar.gz
	sudo rm geckodriver-v0.22.0-linux64.tar.gz
	sudo mv geckodriver /usr/bin
	pip install selenium
fi

echo "Selenium Installed. . ."