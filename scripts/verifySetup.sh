#!/bin/bash
#This script runs the various scripts which verify that the stack was set up correctly

echo "Verifying functionality of Kube-State-Metrics' Prometheus endpoint. . ."
./curl.sh

read -p "Continue? (Enter)" enter
echo "Verifying that InfluxDB is operational, and receiving CPU data from Telegraf."
./query.sh -c

read -p "Continue? (Enter)" enter
echo "Verifying that Telegraf scrapes Kube-State-Metrics' Prometheus endpoint, and sends data to InfluxDB"
./query.sh -k