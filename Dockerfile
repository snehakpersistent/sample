  
FROM quay.io/snehakpersistent/multi-arch-travis:ppc64le

RUN apt-get install -y apache2 apache2-utils\
  && service apache2 start

ADD index.html /var/www/html
  
EXPOSE 80
CMD echo "Started apache server! Hello World."
CMD curl http://localhost:80
