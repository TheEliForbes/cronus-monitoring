#!/bin/bash

NODENAMES=$(kubectl get nodes -o jsonpath='{ .items[*].metadata.name }')
for WATCHEDNODE in $NODENAMES
do
   sed -i "s/WATCHEDNODE/$WATCHEDNODE/g" dashboardTemplate.txt > "$WATCHEDNODE-system-metrics.json"
done
