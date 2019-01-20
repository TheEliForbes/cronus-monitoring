#!/bin/bash
IP=8085
curlCall() {
  curl "http://$(sudo kubectl get svc --namespace kube-system metrics-kube-state-metrics -o json | jq -r .spec.clusterIP):$1/metrics"
}

if [ -n "$1" ]; then
	curlCall $1
else
	curlCall $IP
fi