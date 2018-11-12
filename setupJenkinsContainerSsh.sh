#!/bin/bash
#this execs into the jenkins container
docker exec -t "gallant_einstein" /bin/sh
apk add -y sshpass
exit