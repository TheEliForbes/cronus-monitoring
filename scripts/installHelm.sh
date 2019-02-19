#!/bin/bash

wget https://storage.googleapis.com/kubernetes-helm/helm-v2.11.0-linux-amd64.tar.gz
tar -zxvf helm-v2.11.0-linux-amd64.tar.gz
rm helm-v2.11.0-linux-amd64.tar.gz
mv linux-amd64/helm /usr/local/bin/helm
