FROM alpine

WORKDIR /www

RUN \
  apk update && \
  apk add nginx && \
  apk add php7 php7-fpm php7-openssl php7-pdo php7-pdo_mysql php7-common php7-fileinfo php7-mbstring php7-session php7-json php7-curl
  

COPY src/default.conf /etc/nginx/http.d/default.conf
COPY src/php/www.conf /etc/php7/php-fpm.d/www.conf
COPY src/index.html ./
COPY src/info.php ./
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh


RUN echo "daemon off;" >> /etc/nginx/nginx.conf


RUN echo "基础构建完成，准备启动服务"


#可挂载目录：虚拟主机配置目录，www目录，日志目录
VOLUME ["/etc/nginx/http.d", "/www", "/var/log/nginx"]


EXPOSE 80


CMD /entrypoint.sh



