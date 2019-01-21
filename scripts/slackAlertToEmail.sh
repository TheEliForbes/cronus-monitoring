#!/bin/bash
#This is meant to quickly replace TICKscript slack alerts with simple email alerts.

#This is highly experimental and requires further configuration to be supported.
# Namely, a Topic Handler and SMTP configuration

#USER-TODO: Change this to your preferred email
EMAIL="on.call@your.com"
EMAILSTRING=".email().to('$EMAIL')"

for alert in ../charts/kapacitor/TICKscripts/stream/*.tick;
do
    sed -i "s/.slack()/$EMAILSTRING/g" $alert
done
