#!/bin/bash
# This script generates a .js file with various query exports
#  for use within Grafana's dashboard scripts.
# This is necessary due to the dynamic nature of service IPs.

INFLUXIP=$(sudo kubectl get svc --namespace kube-system data-influxdb -o json | jq -r .spec.clusterIP)

echo "export var hostCount = http://$INFLUXIP:8086/query?q=select+count(*)+from+(select+last(gauge)+%2C+node+from+telegraf..kube_node_info+group+by+node)" > influxQueries.js
# To make more, echo "export var x = http://$INFLUXIP:8086/query?q=..." >> influxQueries.js
#  i.e. Use '>>'


# The variable(s) defined here can be imported in the Grafana scripts like so,
# import { hostCount } from '../influxQueries.js'