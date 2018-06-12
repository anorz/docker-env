FROM alpine:3.6

MAINTAINER anorz <i@anorz.com>


RUN  echo http://mirrors.ustc.edu.cn/alpine/v3.6/main > /etc/apk/repositories 
RUN  echo http://mirrors.ustc.edu.cn/alpine/v3.6/community >> /etc/apk/repositories
RUN  apk update --no-cache
RUN  apk add --no-cache tzdata
RUN  cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

RUN  apk add --no-cache redis
RUN  rm -rf /var/cache/apk/*

ADD redis.conf /etc/redis.conf

VOLUME ["/var/log/redis/" ,"/var/lib/redis/"]

EXPOSE 6379

CMD ["redis-server", "/etc/redis.conf"]