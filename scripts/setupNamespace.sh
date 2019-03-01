#!/bin/bash

if [ -n "$1" ]; then
    if [ -z "$(kubectl get namespaces | grep $1)" ]; then
       echo "Creating Namespace $1"
       kubectl create namespace $1
    else 
       echo "Namespace $1 exists."
    fi

    kubectl create serviceaccount tiller --namespace $1
    
    echo "Replacing namespace values in Role Configuration Files"
    sed "s/NAMESPACE/$1/g" role-tiller-template.yaml > role-tiller-$1.yaml
    sed "s/NAMESPACE/$1/g" rolebinding-tiller-template.yaml > rolebinding-tiller-$1.yaml
    sed "s/kube-system/$1/g" rbac-config.yaml > rbac-config-$1.yaml
    echo "Name replacement complete."
    echo "Creating Tiller Roles in namespace '$1'"
    kubectl create -f rbac-config-$1.yaml
    kubectl create -f role-tiller-$1.yaml
    kubectl create -f rolebinding-tiller-$1.yaml
    helm init --service-account tiller --tiller-namespace $1

    read -p "Set up stack using the given namespace? (y/n)" yn
    case $yn in
     [Yy]* ) ./create.sh $1;;
    esac
else
    echo "Setting up Tiller in default namespace (kube-system)"
    #kubectl create serviceaccount tiller --namespace kube-system
    kubectl create -f rbac-config.yaml
    #helm init --service-account tiller

    read -p "Set up stack? (y/n)" yn
    case $yn in
     [Yy]* ) ./create.sh;;
    esac
fi
