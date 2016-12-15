# Use phusion/baseimage as base image. To make your builds reproducible, make
# sure you lock down to a specific version, not to `latest`!
# See https://github.com/phusion/baseimage-docker/blob/master/Changelog.md for
# a list of version numbers.
FROM vojtabiberle/php7
MAINTAINER Vojtěch Biberle <vojtech.biberle@gmail.com>

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

RUN apt-get purge -y php-xdebug php7.0-fpm && \
    apt-get update && \
    apt-get install -y \
        git

ADD root /
RUN phpenmod essentials
RUN phpenmod sodium

ENV COMPOSER_HOME /composer 
ENV COMPOSER_ALLOW_SUPERUSER=1
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

#CMD ["bash"]
#ENTRYPOINT ["/sbin/setuser $WEBAPP_USER composer"]
#CMD ["--help"]

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
