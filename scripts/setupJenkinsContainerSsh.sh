#!/bin/bash
#this execs into the jenkins container

docker exec -it "jenkinscimaster" /bin/sh
apk add -y sshpass
exit