#!/bin/bash
#This script is deprecated, only use this if you want to do lots of work.

wget https://dl.influxdata.com/influxdb/releases/influxdb_1.4.0_amd64.deb
sudo dpkg -i influxdb_1.4.0_amd64.deb
sudo systemctl start influxdb
wget https://dl.google.com/go/go1.10.4.linux-amd64.tar.gz 
sudo tar -C /usr/local -xzf go1.10.4.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin
export GOBIN=/usr/local/go/bin
sudo curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh
go get -d -v github.com/influxdata/telegraf
sudo apt-get install -y make
cd "$HOME/go/src/github.com/influxdata/telegraf"
make
sudo cp telegraf /usr/bin
telegraf --input-filter prometheus --output-filter influxdb config > telegraf.conf
echo "get ready to code..."

