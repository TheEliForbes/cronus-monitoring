#!/bin/bash
#Eli reclones a lot during dev work..

sudo rm -r TIKsm-setup
git clone https://github.com/Eliforbes42/TIKsm-setup
chmod +x ~/TIKsm-setup/gtikk-charts/*.sh
chmod +x ~/TIKsm-setup/selenium/*.sh
chmod +x ~/TIKsm-setup/siege/*.sh
chmod +x ~/TIKsm-setup/scripts/*.sh
cd ~/TIKsm-setup/