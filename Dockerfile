FROM ppc64le/debian:latest
#FROM quay.io/snehakpersistent/multi-arch-travis:ppc64le

RUN apt-get -y update \
  && apt-get install -y apache2

ADD index.html /var/www/html
  
EXPOSE 80
RUN service apache2 start
CMD echo "Hello from the ubuntu container"
