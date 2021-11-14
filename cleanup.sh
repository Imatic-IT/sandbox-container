#!/bin/bash
set -eu
#You can specify arument to run multiple instances
id="${1:-1}"
containerName=sandbox-container-${id}
docker stop $containerName 
docker rm $containerName
