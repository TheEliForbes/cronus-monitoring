#!/bin/bash
#This script installs jenkins, starts it, and configures it.
#After this script runs, open up localhost:$PORT

docker pull jenkinsci/blueocean

PORT=8087

read -p "Run Jenkins? (y/n)" yn
case $yn in
  [Yy]* ) docker run \
  -u root \
  --rm \
  -d \
  -p 8080:$PORT \
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

echo "--------------------------------------------------------"
echo "Now open up localhost:$PORT"
echo "It will likely ask you to find the password in /var/lib/jenkins/secrets/initialAdminPassword"
echo "You will now be put into the jenkinscimaster container. . ."
docker exec -it "jenkinscimaster" /bin/sh
cat /var/lib/jenkins/secrets/initialAdminPassword
exit
echo "Once setup within the UI is finished, run ./setupJenkinsContainerSsh.sh"

read -p "Install ssh server for jenkins? (y/n)" yn
case $yn in
  [Yy]* ) chmod +x setupJenkinsContainerSsh; ./setupJenkinsContainerSsh;;
  [Nn]* ) true;;
esac
