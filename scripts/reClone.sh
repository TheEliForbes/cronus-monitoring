#!/bin/bash
#Eli reclones a lot during dev work..

sudo rm -r cronus-monitoring
git clone https://github.com/Eliforbes42/cronus-monitoring
chmod +x ~/cronus-monitoring/gtikk-charts/*.sh
chmod +x ~/cronus-monitoring/selenium/*.sh
chmod +x ~/cronus-monitoring/siege/*.sh
chmod +x ~/cronus-monitoring/scripts/*.sh
cd ~/cronus-monitoring/