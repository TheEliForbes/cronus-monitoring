#!/bin/bash
if [ -n "$1" ]; then
	$namespace = "$1"
fi

if [ -n "$1" ]; then
    #kubectl create serviceaccount tiller --namespace $1
    #echo "Replacing namespace values in Role Configuration Files"
    #sed "s/NAMESPACE/$1/g" role-tiller-template.yaml > role-tiller.yaml
    #sed "s/NAMESPACE/$1/g" rolebinding-tiller-template.yaml > rolebinding-tiller.yaml
    #echo "Name replacement complete."
    #echo "Creating Tiller Roles in namespace '$1'"
    #kubectl create -f role-tiller.yaml
    #kubectl create -f rolebinding-tiller.yaml
    #helm init --service-account tiller --tiller-namespace $1

    read -p "Set up stack using the given namespace?" yn
    case $yn in
     [Yy]* ) ./create.sh $1;;
    esac
else
    #echo "Setting up Tiller in default namespace (kube-system)"
    #kubectl create serviceaccount tiller --namespace kube-system
    #kubectl create -f rbac-config.yaml
    #helm init --service-account tiller
fi


