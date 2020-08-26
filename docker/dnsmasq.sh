#!/bin/sh
# Portainer
# https://www.portainer.io
# https://www.portainer.io/installation/

# Portainer server

sudo docker volume create portainer_data

NAME=portainer
IMAGE=portainer/portainer

sudo docker pull $IMAGE
sudo docker stop $NAME
sudo docker rm -v $NAME

sudo docker run --detach --restart=always \
  --name $NAME \
  --cpus=2 \
  --cpu-shares=1024 \
  --publish published=8000,target=8000,protocol=tcp,mode=ingress \
  --publish published=9000,target=9000,protocol=tcp,mode=ingress \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v portainer_data:/data \
  $IMAGE
