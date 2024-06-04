FROM alpine:3.17

RUN	apk update && apk upgrade && apk add mariadb mariadb-client

COPY ./conf/script_mdb.sh .
RUN chmod +x /script_mdb.sh

CMD [ "/script_mdb.sh" ]
