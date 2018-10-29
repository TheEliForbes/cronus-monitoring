#!/bin/bash

sudo kubectl logs -f --namespace kube-system \
$(sudo kubectl get pods --namespace kube-system -l app=alerts-kapacitor -o jsonpath='{ .items[0].metadata.name }')