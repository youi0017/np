FROM alpine

WORKDIR /www

RUN \
  apk update && \
  apk add nginx && \
  apk add php7 php7-fpm php7-openssl php7-pdo php7-pdo_mysql php7-common php7-fileinfo php7-mbstring php7-session php7-json php7-curl && \
  apk add libstdc++
  

COPY src/default.conf /etc/nginx/http.d/default.conf
COPY src/php/www.conf /etc/php7/php-fpm.d/www.conf
COPY src/index.html ./
COPY src/info.php ./
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

COPY src/php/http.php ./
COPY src/php/websocket.php ./
COPY src/php/tcp.php ./
COPY src/php/udp.php ./

#add php-swoole
COPY src/php/swoole488.so /usr/lib/php7/modules/20.swoole488.so

RUN touch /etc/php7/conf.d/swoole.ini && \
    echo 'extension=20.swoole488.so' > /etc/php7/conf.d/swoole.ini


RUN echo "daemon off;" >> /etc/nginx/nginx.conf


RUN echo "基础构建完成，准备启动服务"


#可挂载目录：虚拟主机配置目录，www目录，日志目录
VOLUME ["/etc/nginx/http.d", "/www", "/var/log/nginx"]


EXPOSE 80


# CMD /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]



