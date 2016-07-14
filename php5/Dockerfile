# Use phusion/baseimage as base image. To make your builds reproducible, make
# sure you lock down to a specific version, not to `latest`!
# See https://github.com/phusion/baseimage-docker/blob/master/Changelog.md for
# a list of version numbers.
FROM phusion/baseimage:0.9.19
MAINTAINER Vojtěch Biberle <vojtech.biberle@gmail.com>

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

ENV LANG C.UTF-8
RUN add-apt-repository -y ppa:ondrej/php && \
    apt-get update && \
    apt-get install -y \
        php5.6 \
        php5.6-cgi \
        php5.6-curl \
        php5.6-gd \
        php5.6-gmp \
        php5.6-json \
        php5.6-ldap \
        php5.6-mysql \
        php5.6-odbc \
        php5.6-opcache \
        php5.6-pgsql \
        php5.6-pspell \
        php5.6-readline \
        php5.6-recode \
        php5.6-sqlite3 \
        php5.6-tidy \
        php5.6-xml \
        php5.6-xmlrpc \
        php5.6-bcmath \
        php5.6-bz2 \
        php5.6-enchant \
        php5.6-fpm \
        php5.6-imap \
        php5.6-interbase \
        php5.6-intl \
        php5.6-mbstring \
        php5.6-mcrypt \
        php5.6-phpdbg \
        php5.6-soap \
        php5.6-sybase \
        php5.6-xsl \
        php5.6-zip \
        php5.6-xdebug

ADD root /

ENV WEBAPP_DIR /var/www/website
ENV WEBAPP_USER webapp
ENV WEBAPP_GROUP webapp
ENV WEBAPP_GID 1000
ENV WEBAPP_UID 1000

WORKDIR $WEBAPP_DIR
VOLUME [$WEBAPP_DIR]
RUN phpenmod essentials
RUN groupadd -g $WEBAPP_GID $WEBAPP_GROUP && \
    useradd -d /var/www/website -g $WEBAPP_GID -u $WEBAPP_UID $WEBAPP_USER && \
    chown $WEBAPP_USER:$WEBAPP_GROUP $WEBAPP_DIR && \
    chown $WEBAPP_USER:$WEBAPP_GROUP /run/php
RUN sed -i "s/^;daemonize = yes/daemonize = no/g" /etc/php/5.6/fpm/php-fpm.conf
RUN sed -i "s/^user = www-data/user = $WEBAPP_USER/g" /etc/php/5.6/fpm/pool.d/www.conf && \
    sed -i "s/^group = www-data/group = $WEBAPP_GROUP/g" /etc/php/5.6/fpm/pool.d/www.conf && \
    sed -i "s/^listen.owner = www-data/listen.owner = $WEBAPP_GROUP/g" /etc/php/5.6/fpm/pool.d/www.conf && \
    sed -i "s/^listen.group = www-data/listen.group = $WEBAPP_GROUP/g" /etc/php/5.6/fpm/pool.d/www.conf && \
    sed -i "s@^;chdir = /var/www@chdir = $WEBAPP_DIR@g" /etc/php/5.6/fpm/pool.d/www.conf && \
    sed -i "s/^;clear_env = no/clear_env = no/g" /etc/php/5.6/fpm/pool.d/www.conf

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
