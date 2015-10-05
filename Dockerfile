# A basic apache server. To use either add or bind mount content under /var/www
FROM ubuntu:12.04

MAINTAINER A A

RUN apt-get update && apt-get install -y apache2 && apt-get clean && rm -rf /var/lib/apt/lists/*

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

COPY ./index.html /var/www/html
EXPOSE 80

CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]