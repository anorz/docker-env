#!/bin/bash

docker rm -f nginx
docker rmi alpine-nginx-1.12:latest

docker build --tag alpine-nginx-1.12 .

docker run  -d -it \
    -p 80:80  \
    -p 443:443 \
    -v /root/dockerspace/docker-env/nginx/logs/:/var/log/nginx/ \
    -v /root/dockerspace/docker-env/www/:/www  \
    --link php71:Dphp \
    --name nginx \
    alpine-nginx-1.12

