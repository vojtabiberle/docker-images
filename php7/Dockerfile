# Use phusion/baseimage as base image. To make your builds reproducible, make
# sure you lock down to a specific version, not to `latest`!
# See https://github.com/phusion/baseimage-docker/blob/master/Changelog.md for
# a list of version numbers.
FROM phusion/baseimage:0.9.19
MAINTAINER Vojtěch Biberle <vojtech.biberle@gmail.com>

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

RUN apt-get update && \
    apt-get install -y software-properties-common && \
    LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/php && \
    apt-get update && \

    apt-get install -y \
        php7.0 \
        php7.0-cgi \
        php7.0-curl \
        php7.0-gd \
        php7.0-gmp \
        php7.0-json \
        php7.0-ldap \
        php7.0-mysql \
        php7.0-odbc \
        php7.0-opcache \
        php7.0-pgsql \
        php7.0-pspell \
        php7.0-readline \
        php7.0-recode \
        php7.0-sqlite3 \
        php7.0-tidy \
        php7.0-xml \
        php7.0-xmlrpc \
        php7.0-bcmath \
        php7.0-bz2 \
        php7.0-enchant \
        php7.0-fpm \
        php7.0-imap \
        php7.0-interbase \
        php7.0-intl \
        php7.0-mbstring \
        php7.0-mcrypt \
        php7.0-phpdbg \
        php7.0-soap \
        php7.0-sybase \
        php7.0-xsl \
        php7.0-zip \
        php-memcached \
        php-xdebug \
        php-libsodium \
        php-pear \
        git && \
    apt-get purge -y php7.1-common

RUN update-alternatives --set php /usr/bin/php7.0

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
    useradd -d $WEBAPP_DIR -g $WEBAPP_GID -u $WEBAPP_UID $WEBAPP_USER && \
    chown $WEBAPP_USER:$WEBAPP_GROUP $WEBAPP_DIR && \
    chown $WEBAPP_USER:$WEBAPP_GROUP /run/php
RUN sed -i "s/^;daemonize = yes/daemonize = no/g" /etc/php/7.0/fpm/php-fpm.conf
RUN sed -i "s/^user = www-data/user = $WEBAPP_USER/g" /etc/php/7.0/fpm/pool.d/www.conf && \
    sed -i "s/^group = www-data/group = $WEBAPP_GROUP/g" /etc/php/7.0/fpm/pool.d/www.conf && \
    sed -i "s/^listen.owner = www-data/listen.owner = $WEBAPP_GROUP/g" /etc/php/7.0/fpm/pool.d/www.conf && \
    sed -i "s/^listen.group = www-data/listen.group = $WEBAPP_GROUP/g" /etc/php/7.0/fpm/pool.d/www.conf && \
    sed -i "s@^;chdir = /var/www@chdir = $WEBAPP_DIR@g" /etc/php/7.0/fpm/pool.d/www.conf && \
    sed -i "s/^;clear_env = no/clear_env = no/g" /etc/php/7.0/fpm/pool.d/www.conf

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
