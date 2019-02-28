#!/bin/bash

namespace="kube-system"
if [ -n "$1" ]; then
	namespace="$1"
fi

PORT=8085
curlCall() {
  curl "http://$(sudo kubectl get svc --namespace $namespace metrics-kube-state-metrics -o json | jq -r .spec.clusterIP):$1/metrics"
}

curlCall $PORT