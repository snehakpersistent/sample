FROM ppc64le/debian:latest
#FROM quay.io/snehakpersistent/multi-arch-travis:ppc64le

RUN apt -y update \
  && apt install -y apache2 curl

ADD index.html /var/www/html
RUN sed -i 's/Listen 80/Listen 8080/' /etc/apache2/ports.conf
EXPOSE 8080
RUN service apache2 start
USER 1001
CMD sleep 2000s

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
