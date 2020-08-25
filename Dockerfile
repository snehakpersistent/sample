  
FROM quay.io/snehakpersistent/multi-arch-travis:ppc64le

RUN apt-get install -y php7.2 php7.2-cli php7.2-common \
  && apt-get install -y apache2 \
  && systemctl start apache2

ADD index.php /var/www/html

RUN sed -i 's/Listen 80/Listen 8080/' /etc/httpd/conf/httpd.conf \
  && mkdir /run/php-fpm \
  && chgrp -R 0 /var/log/httpd /var/run/httpd /run/php-fpm \
  && chmod -R g=u /var/log/httpd /var/run/httpd /run/php-fpm
  
EXPOSE 8080

USER 1001

CMD php-fpm & httpd -D FOREGROUND
