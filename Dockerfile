#先装php7
#build: docker build --tag alpine-php-7.1 .
docker run  -d -it \
    -p 9000:9000  \
    -v /root/dockerspace/docker-env/php7/logs/:/var/log/php7/ \
    -v /root/dockerspace/docker-env/www/:/www  \
    --name php71 \
    alpine-php-7.1


#nginx
#build: docker build --tag alpine-nginx-1.12 .
docker run  -d -it \
    -p 80:80  \
    -p 443:443 \
    -v /root/dockerspace/docker-env/nginx/logs/:/var/log/nginx/ \
    -v /root/dockerspace/docker-env/www/:/www  \
    --link php71:Dphp \
    --name nginx \
    alpine-nginx-1.12 