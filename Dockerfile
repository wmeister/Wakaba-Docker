FROM httpd:2.4

RUN apt update
RUN apt -y upgrade
RUN apt install -y perl imagemagick carton build-essential wget
COPY ./public-html/ /usr/local/apache2/htdocs/
WORKDIR /usr/local/apache2/htdocs
COPY ./my-httpd.conf /usr/local/apache2/conf/httpd.conf
RUN rm index.html
RUN mkdir res src thumb
RUN touch wakaba.sql 
RUN chmod 0777 . res src thumb wakaba.pl captcha.pl wakaba.sql
RUN carton install
WORKDIR /tmp
RUN /usr/local/apache2/bin/httpd && wget http://localhost/wakaba.pl

