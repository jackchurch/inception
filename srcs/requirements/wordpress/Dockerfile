FROM alpine:3.17

RUN apk update && apk upgrade
RUN apk add curl php81 php81-fpm php81-bcmath php81-cli
RUN apk add php81-curl php81-dom php81-exif php81-fileinfo php81-gd
RUN apk add php81-iconv php81-json php81-mbstring php81-mysqli
RUN apk add php81-openssl php81-pcntl php81-pdo php81-pdo_mysql
RUN apk add php81-phar php81-posix php81-session mariadb-client
RUN apk add php81-simplexml php81-sqlite3 php81-tokenizer php81-xml
RUN apk add php81-xmlreader php81-xmlwriter php81-zip php81-zlib

COPY ./conf/script_wp.sh /var/www/html/wordpress/.
RUN chmod +x /var/www/html/wordpress/script_wp.sh

WORKDIR /var/www/html/wordpress

CMD [ "/var/www/html/wordpress/script_wp.sh" ]
