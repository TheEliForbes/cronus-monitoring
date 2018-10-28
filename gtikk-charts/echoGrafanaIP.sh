#!/bin/bash

echo "Grafana is at http://$(sudo kubectl get svc --namespace kube-system dash-grafana -o json | jq -r .spec.clusterIP)"