#!/bin/bash

kapacitor-unit -kapacitor http://$(sudo kubectl get pods --namespace kube-system -l app=alerts-kapacitor -o jsonpath='{ .items[0].metadata.name }') -dir ../gtikk-charts/kapacitor/TICKscripts/stream -tests ../gtikk-charts/kapacitor/TICKscripts/tests/podstatus_test.yaml