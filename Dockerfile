  
FROM quay.io/snehakpersistent/multi-arch-travis:ppc64le

RUN apt-get install -y apache2 \
  && service apache2 start

ADD index.html /var/www/html
  
EXPOSE 80
CMD httpd -D FOREGROUND
