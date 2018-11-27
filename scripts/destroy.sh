#!/bin/bash

helm delete metrics data polling hosts alerts dash --purge
#kubectl delete ns tick