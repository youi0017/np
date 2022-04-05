FROM alpine

WORKDIR /wwwroot

COPY src/default.conf /etc/nginx/http.d/default.conf
COPY src/index.html /wwwroot

RUN apk update && apk add nginx
	
EXPOSE 80


CMD echo 'hello' && exec nginx -g 'daemon off;'


