# Use phusion/baseimage as base image. To make your builds reproducible, make
# sure you lock down to a specific version, not to `latest`!
# See https://github.com/phusion/baseimage-docker/blob/master/Changelog.md for
# a list of version numbers.
FROM vojtabiberle/php7
MAINTAINER Vojtěch Biberle <vojtech.biberle@gmail.com>

ENV APACHE_RUN_USER $WEBAPP_USER
ENV APACHE_RUN_GROUP $WEBAPP_GROUP
ENV APACHE_DOCUMENTROOT $WEBAPP_DIR

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

RUN apt-add-repository multiverse && \
    apt-get update && \ 
    apt-get install -y \
    apache2 \
    libapache2-mod-fastcgi

ADD root /

RUN gpasswd -a www-data $WEBAPP_GROUP && \
    a2enmod actions fastcgi alias && \
    a2enconf php7.0-fpm && \
    a2enmod proxy_fcgi && \
    #a2enconf php7.0-cgi && \
    a2dissite 000-default && \
    a2ensite localhost

RUN phpenmod essentials

EXPOSE 80 443

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*