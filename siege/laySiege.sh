#!/bin/bash

echo "We have them surrounded. . ."
wait 1

siege -f grafanaUrls.txt -c 5 -r 25 #5 users, 25reps
siege -f influxUrls.txt -c 5 -r 25
siege -f ksmUrls.txt -c 5 -r 25

echo "Siege has been completed. . ."