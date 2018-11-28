#!/bin/bash

WATCHEDNODE=$(kubectl get nodes -o jsonpath='{ .items[*].metadata.name }')
for each in $WATCHEDNODE
do
   echo $each
done
