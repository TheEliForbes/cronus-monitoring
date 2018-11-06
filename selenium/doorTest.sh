#!/bin/bash

python login.py $(sudo kubectl get svc --namespace kube-system dash-grafana -o json | jq -r .spec.clusterIP)