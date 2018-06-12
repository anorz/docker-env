#!/bin/bash

path=`pwd`
#www
WWW_PATH=$path/www
#php7
PHP7_PATH=$path/php7
#nginx
NGINX_PATH=$path/nginx
#redis
REDIS_PATH=$path/redis
#mysql
MYSQL_PATH=$path/mysql
#build mirrors
docker build --tag alpine-php-7.1 $PHP7_PATH
echo -e "\e[32m\e[1m`date "+%Y-%m-%d %H:%M:%S"` ▶mirror [ php ] create success. \e[0m\n"
docker build --tag alpine-nginx-1.12 $NGINX_PATH
echo -e "\e[32m\e[1m`date "+%Y-%m-%d %H:%M:%S"` ▶mirror [nginx] create success. \e[0m\n"
docker build --tag alpine-redis-3.2.11 $REDIS_PATH
echo -e "\e[32m\e[1m`date "+%Y-%m-%d %H:%M:%S"` ▶mirror [redis] create success. \e[0m\n"
docker build --tag alpine-maridb-10.1 $MYSQL_PATH
echo -e "\e[32m\e[1m`date "+%Y-%m-%d %H:%M:%S"` ▶mirror [maridb] create success. \e[0m\n"
#create containers
#php7
docker run  -d -it \
    -p 9000:9000  \
    -v $PHP7_PATH/logs/:/var/log/php7/ \
    -v $WWW_PATH/:/www  \
    --name php71 \
    alpine-php-7.1
echo -e "\e[32m\e[1m`date "+%Y-%m-%d %H:%M:%S"` ▶contrainer [ php ] create success. \e[0m\n"
#nginx
docker run  -d -it \
    -p 80:80  \
    -p 443:443 \
    -v $NGINX_PATH/logs/:/var/log/nginx/ \
    -v $WWW_PATH/:/www  \
    --link php71:Dphp \
    --name nginx \
    alpine-nginx-1.12
echo -e "\e[32m\e[1m`date "+%Y-%m-%d %H:%M:%S"` ▶contrainer [nginx] create success. \e[0m\n"
#redis
docker run  -d -it \
    -p 6379:6379  \
    -v $REDIS_PATH/logs/:/var/log/redis/ \
    -v $REDIS_PATH/data/:/var/lib/redis/ \
    --name redis \
    alpine-redis-3.2.11
echo -e "\e[32m\e[1m`date "+%Y-%m-%d %H:%M:%S"` ▶contrainer [redis] create success. \e[0m\n"
#mysql
docker run -d -p 3306:3306 \
    --name maridb \
    -v $MYSQL_PATH/data/:/var/lib/mysql \
    -v $MYSQL_PATH/logs/:/var/log/mysql/ \
    -e MYSQL_DATABASE=test \
    -e MYSQL_USER=dev \
    -e MYSQL_PASSWORD=dev \
    -e MYSQL_ROOT_PASSWORD=123123 \
    alpine-maridb-10.1
echo -e "\e[32m\e[1m`date "+%Y-%m-%d %H:%M:%S"` ▶contrainer [mysql] create success. \e[0m\n"