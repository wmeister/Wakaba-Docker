FROM httpd:2.4
COPY ./public-html/ /usr/local/apache2/htdocs/
WORKDIR /usr/local/apache2/htdocs
COPY ./my-httpd.conf /usr/local/apache2/conf/httpd.conf
RUN rm index.html
RUN apt update
RUN apt -y upgrade
RUN apt install -y perl imagemagick wget carton build-essential
RUN mkdir res src thumb
RUN chmod 0777 . res src thumb wakaba.pl captcha.pl
RUN carton install
RUN perl wakaba.pl
RUN ln wakaba.html index.html