FROM httpd:2.4
COPY ./public-html/ /usr/local/apache2/htdocs/
COPY ./my-httpd.conf /usr/local/apache2/conf/httpd.conf
RUN "apt" "update"
RUN "apt" "-y" "upgrade"
RUN "apt" "install" "-y" "perl"