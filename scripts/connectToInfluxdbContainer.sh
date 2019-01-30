#!/bin/bash

sudo kubectl exec -i -t --namespace kube-system \
$(sudo kubectl get pods --namespace kube-system -l app=data-influxdb -o jsonpath='{ .items[0].metadata.name }') \
/bin/sh