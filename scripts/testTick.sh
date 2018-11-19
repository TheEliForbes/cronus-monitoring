#!/bin/bash

kapacitor-unit -kapacitor http://$(sudo kubectl get pods --namespace kube-system -l app=alerts-kapacitor -o jsonpath='{ .items[0].metadata.name }') -dir ../kapacitor/TICKscripts/stream -tests ../kapacitor/TICKscripts/tests/podstatus_test.yaml