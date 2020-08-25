  
FROM quay.io/snehakpersistent/multi-arch-travis:ppc64le

RUN apt-get install -y apache2 apache2-utils

ADD index.html /var/www/html
  
EXPOSE 80
RUN service apache2 start
