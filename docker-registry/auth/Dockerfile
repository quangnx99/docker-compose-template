
FROM registry

ENV USER admin
ENV PASSWORD 123456aA@

RUN apk add --no-cache apache2-utils

RUN mkdir /auth

RUN htpasswd -bnB ${USER} ${PASSWORD} > /auth/htpasswd

