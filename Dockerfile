FROM inclusivedesign/php:5.4

ADD data/ /var/www/wiki/
ADD start.sh /usr/local/bin/start.sh

RUN chmod +x /usr/local/bin/start.sh && \
    yum -y install ImageMagick

VOLUME ["/var/www/wiki/images/"]

EXPOSE 80

CMD ["/usr/local/bin/start.sh"]
