FROM alpine:3.6

MAINTAINER anorz <i@anorz.com>


RUN  echo http://mirrors.ustc.edu.cn/alpine/v3.6/main > /etc/apk/repositories 
RUN  echo http://mirrors.ustc.edu.cn/alpine/v3.6/community >> /etc/apk/repositories
RUN  apk update --no-cache
RUN  apk add --no-cache tzdata
RUN  cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime


RUN apk add --no-cache mysql mysql-client

ADD my.cnf /etc/mysql/my.cnf

ADD entrypoint.sh /entrypoint.sh


VOLUME ["/var/lib/mysql"]

EXPOSE 3306

ENTRYPOINT ["/entrypoint.sh"]

