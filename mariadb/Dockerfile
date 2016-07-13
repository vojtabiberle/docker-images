# Use phusion/baseimage as base image. To make your builds reproducible, make
# sure you lock down to a specific version, not to `latest`!
# See https://github.com/phusion/baseimage-docker/blob/master/Changelog.md for
# a list of version numbers.
FROM phusion/baseimage:0.9.19
MAINTAINER Vojtěch Biberle <vojtech.biberle@gmail.com>

ENV DB_USER user
ENV DB_PASSWORD secret
ENV DB_NAME db
ENV DB_DATADIR /var/lib/mysql

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

RUN apt-get update && \
    apt-get install -y \
    mariadb-server \
    mariadb-client

ADD root /

RUN sed -i "s@^datadir         = /var/lib/mysql@datadir         = $DB_DATADIR@g" /etc/mysql/mariadb.conf.d/50-server.cnf && \
    sed -i "s/^skip_log_error//g" /etc/mysql/mariadb.conf.d/50-mysqld_safe.cnf && \
    sed -i "s/^syslog//g" /etc/mysql/mariadb.conf.d/50-mysqld_safe.cnf

VOLUME [$DB_DATADIR]

EXPOSE 3306

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*