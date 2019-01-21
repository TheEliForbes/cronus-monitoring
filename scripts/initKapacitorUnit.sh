#!/bin/bash

if ! [ -x "$(command -v go)" ]; then
    echo "Go is not installed."
    cd $HOME
    wget https://dl.google.com/go/go1.10.4.linux-amd64.tar.gz
    sudo tar -C /usr/local -xzf go1.10.4.linux-amd64.tar.gz
    export PATH=$PATH:/usr/local/go/bin
    export GOBIN=/usr/local/go/bin
    mkdir go
    export GOPATH=$HOME/go
    go get -v github.com/gpestana/kapacitor-unit
    go get -u -v gopkg.in/h2non/gock.v1
    go install github.com/gpestana/kapacitor-unit
	kapacitor-unit
fi

echo "You may need to run 'export PATH=$PATH:/usr/local/go/bin' again due to scoping issues. . ."