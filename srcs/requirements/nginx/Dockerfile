FROM alpine:3.17

RUN	 apk update && apk upgrade && apk add nginx openssl

RUN mkdir -p /var/www/html/
COPY ./conf/nginx.conf /etc/nginx/http.d/nginx.conf

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048\
 -keyout /etc/ssl/private/nginx-selfsigned.key\
 -out /etc/ssl/certs/nginx-selfsigned.crt\
 -subj "/C=AU/ST=South Australia/L=Adelaide/O=42Adelaide/OU=Student/CN=jchurch"

RUN adduser -D -g 'www' www &&\
 chown -R www:www /run/nginx/ &&\
 chown -R www:www /var/www/html/

EXPOSE 443

CMD [ "nginx", "-g", "daemon off;" ]
