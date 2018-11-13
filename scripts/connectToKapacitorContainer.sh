#!/bin/bash

sudo kubectl exec -i -t --namespace kube-system \
$(sudo kubectl get pods --namespace kube-system -l app=alerts-kapacitor -o jsonpath='{ .items[0].metadata.name }') \
/bin/sh