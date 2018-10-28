#!/bin/bash

curl "http://"$(sudo kubectl get svc --namespace kube-system metrics-kube-state-metrics -o json | jq -r .spec.clusterIP)":8080/metrics"
)