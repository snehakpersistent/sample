
FROM quay.io/snehakpersistent/multi-arch-travis:ppc64le

RUN apt -y update \
  && apt install -y apache2 curl

ADD index.html /var/www/html
RUN cat /var/www/html/index.html

RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf \
  && sed -i 's/Listen 80/Listen 8080/' /etc/apache2/ports.conf \
  && sed -i 's/VirtualHost *:80/VirtualHost *:8080/' /etc/apache2/sites-enabled/000-default.conf

RUN service apache2 start 
RUN curl http://localhost:8080
EXPOSE 8080
CMD apachectl -D FOREGROUND


