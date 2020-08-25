  
FROM quay.io/snehakpersistent/multi-arch-travis:ppc64le

RUN apt-get install -y apache2

ADD index.html /var/www/html
  
EXPOSE 80

USER 1001

CMD httpd -D FOREGROUND
