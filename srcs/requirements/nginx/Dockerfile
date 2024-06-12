FROM alpine:3.17

RUN	 apk update && apk upgrade && apk add nginx openssl

RUN mkdir -p /var/www/html/
COPY ./conf/nginx.conf /etc/nginx/http.d/.

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048\
 -keyout /etc/ssl/private/nginx-selfsigned.key\
 -out /etc/ssl/certs/nginx-selfsigned.crt\
 -subj "/C=AU/ST=South Australia/L=Adelaide/O=42Adelaide/OU=Student/CN=SCRIPT_TO_CHANGE_ME"

RUN adduser -D -g 'www' www &&\
 chown -R www:www /run/nginx/ &&\
 chown -R www:www /var/www/html/

EXPOSE 443

RUN rm -f /etc/nginx/http.d/default.conf
RUN sed -i "s|ssl_protocols TLSv1.1 TLSv1.2 TLSv1.3;|ssl_protocols TLSv1.2 TLSv1.3;|g" /etc/nginx/nginx.conf

CMD [ "nginx", "-g", "daemon off;" ]
