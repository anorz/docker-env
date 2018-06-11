FROM alpine:3.6

# PHP 7.1.17
MAINTAINER anorz <i@anorz.com>


RUN  echo http://mirrors.ustc.edu.cn/alpine/v3.6/main > /etc/apk/repositories 
RUN  echo http://mirrors.ustc.edu.cn/alpine/v3.6/community >> /etc/apk/repositories
RUN  apk update --no-cache
RUN  apk add --no-cache tzdata
RUN  cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime


RUN  apk add --no-cache php7 php7-fpm php7-ftp php7-fileinfo php7-curl php7-redis php7-memcached php7-pear php7-calendar \
              php7-ctype php7-dom php7-exif php7-gd php7-gettext php7-iconv php7-gmp php7-imap php7-phar \
              php7-json php7-mbstring php7-mcrypt php7-mysqli php7-mysqlnd php7-odbc php7-opcache   \
              php7-pdo_dblib php7-pdo_mysql php7-pdo_odbc php7-pdo_pgsql php7-pdo_sqlite php7-pgsql  \
              php7-posix php7-session php7-shmop php7-simplexml php7-sockets php7-sqlite3 php7-sysvmsg \
              php7-sysvsem php7-sysvshm php7-tidy php7-tokenizer php7-xmlrpc php7-zip php7-zlib

RUN  rm -rf /var/cache/apk/*

ADD php.ini /etc/php7/
ADD php-fpm.conf  /etc/php7/php-fpm.conf
ADD php-fpm.d/*   /etc/php7/php-fpm.d/


VOLUME [ "/var/log/php7/","/www"]

EXPOSE 9000

CMD ["php-fpm7", "-F"]
