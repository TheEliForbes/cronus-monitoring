#!/bin/bash

NODENAMES=$(kubectl get nodes -o jsonpath='{ .items[*].metadata.name }')
for WATCHEDNODE in $NODENAMES
do
   sed "s/WATCHEDNODE/$WATCHEDNODE/g" systemDashboardTemplate.txt > "$WATCHEDNODE-system-metrics.json"
done
