FROM alpine:3.6

MAINTAINER anorz <i@anorz.com>


RUN  echo http://mirrors.ustc.edu.cn/alpine/v3.6/main > /etc/apk/repositories 
RUN  echo http://mirrors.ustc.edu.cn/alpine/v3.6/community >> /etc/apk/repositories
RUN  apk update --no-cache
RUN  apk add --no-cache tzdata
RUN  cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN  apk add --no-cache nginx
RUN  mkdir -p /run/nginx/
RUN  rm -rf /var/cache/apk/*

ADD vhosts/* /etc/nginx/conf.d/
ADD nginx.conf  /etc/nginx/nginx.conf


VOLUME [ "/var/log/nginx/" ,"/www/"]

EXPOSE 80
EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
