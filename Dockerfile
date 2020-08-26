FROM ppc64le/debian:latest
#FROM quay.io/snehakpersistent/multi-arch-travis:ppc64le

RUN apt -y update \
  && apt install -y apache2 curl

ADD index.html /var/www/html
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf \
  && sed -i 's/Listen 80/Listen 8080/' /etc/apache2/ports.conf \
  && sed -i 's/VirtualHost *:80/VirtualHost *:8080/' /etc/apache2/sites-enabled/000-default.conf
#RUN whoami

EXPOSE 8080
CMD apachectl -D FOREGROUND
#RUN service apache2 status
#RUN curl http://localhost:8080
#CMD sleep 2000s

#FROM ppc64le/centos:latest

#RUN yum --disableplugin=subscription-manager -y module enable php:7.2 \
#  && yum --disableplugin=subscription-manager -y install httpd php \
#  && yum --disableplugin=subscription-manager clean all

#ADD index.php /var/www/html

#RUN sed -i 's/Listen 80/Listen 8080/' /etc/httpd/conf/httpd.conf \
#  && mkdir /run/php-fpm \
#  && chgrp -R 0 /var/log/httpd /var/run/httpd /run/php-fpm \
#  && chmod -R g=u /var/log/httpd /var/run/httpd /run/php-fpm

#EXPOSE 8080

#USER 1001

#CMD php-fpm & httpd -D FOREGROUND
