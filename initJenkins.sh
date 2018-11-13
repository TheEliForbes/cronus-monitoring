#!/bin/bash
#This script installs jenkins, starts it, and configures it.
docker pull jenkinsci/blueocean

read -p "Run Jenkins? (y/n)" yn
case $yn in
  [Yy]* ) docker run \
  -u root \
  --rm \
  -d \
  -p 8080:8080 \
  -p 50000:50000 \
  -v jenkins-data:/var/jenkins_home \
  -v /var/run/docker.sock:/var/run/docker.sock \
  --name=jenkinscimaster \
  jenkinsci/blueocean > jenkinsPasswordFile.txt;;
esac

read -p "Install ssh server for jenkins? (y/n)" yn
case $yn in
[Nn]* ) exit;;
esac

sudo apt-get install -y openssh-server
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.factory-defaults
sudo chmod a-w /etc/ssh/sshd_config.factory-defaults
sudo systemctl restart ssh
mkdir ~/.ssh
chmod 700 ~/.ssh
ssh-keygen -t rsa