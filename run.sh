#!/bin/bash
#Start docker and pass public key to env variable, get container id
cId=$(docker run -e AUTHORIZED_KEY_ROOT="$(ssh-add -L)" -d janpekar/sandbox-container)
#Inspect container with id and get its ip
ip=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $cId)
#Ssh to that IP - disable strict host key checking because identity of container changes
ssh -o StrictHostKeyChecking=no -o ForwardAgent=yes root@$ip
