FROM alpine

WORKDIR /www


RUN \
  apk update && \
  apk add nginx php7 php7-fpm
  
#php7-fpm 对应指令php-fpm7
#RUN mkdir /run/php && chown nginx /run/php


COPY src/default.conf /etc/nginx/http.d/default.conf
COPY src/php/www.conf /etc/php7/php-fpm.d/www.conf
COPY src/index.html /www
COPY src/info.php /www
COPY start.sh /www/start.sh
RUN chmod +x /www/start.sh


RUN echo "daemon off;" >> /etc/nginx/nginx.conf
#RUN php-fpm7

RUN echo "基础构建完成，准备启动服务"

#可挂载目录：虚拟主机配置目录，日志目录，www目录
VOLUME ["/etc/nginx/http.d", "/var/log/nginx", "/www"]


EXPOSE 80

CMD /www/start.sh

#CMD nginx && exec php-fpm7


#CMD echo 'nginx installed' && exec nginx -g 'daemon off;' && exec nginx -th'

#CMD ["-th"]
#ENTRYPOINT ["nginx"]








#启动参考一
# podman run -itd --name web1 -p 9001:80 nginx

#启动参考二
# podman run -itd --name web2 -p 9001:80 -v /www/9001/html:/www -v /www/9001/log:/var/log/nginx nginx


