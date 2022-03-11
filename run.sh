#!/bin/bash
set -eu
#You can specify arument to run multiple instances
id="${1:-1}"
#Docker run parameters
runParams="${2}"
containerName=sandbox-container-${id}
imageName=janpekar/sandbox-container
#Check if container is not running
if [ ! "$(docker ps -q -f name=$containerName)" ]; then
  #Start docker and pass public key to env variable
  docker start $containerName 2>&1 || docker run -e AUTHORIZED_KEY_ROOT="$(ssh-add -L)" -d $runParams --name $containerName $imageName
  #Wait until container is started
  sleep 1
fi
#Inspect container with id and get its ip
ip=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $containerName)
#Ssh to that IP - disable strict host key checking because identity of container changes
ssh -o StrictHostKeyChecking=no -o ForwardAgent=yes root@$ip
