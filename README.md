# Docker containers
This repository contains sources of my containers based 
on great phusion's [baseimage-docker](https://github.com/phusion/baseimage-docker).

## Containers philosophy
Every container provides one service and can be modified with environment variables.
Becouse I use this images for development, I created user in all containers with
same ID as ID of my own user on my own notebook (1000) - you can offcourse
modify this by environment variable. Becouse of that, I don't need to solve 
issues with file ownership.

## Basic description
### php7
This is base container for apache-php7 and composer container. It runs inside 
php-fpm and you can use it, if you want webserver running in different container.
I think, webserver and php-fpm are one service, so I created apache-php7 container.

### apache-php7
This container runs apache2.4 with mpm-event and php7.0-fpm. So its faster than
apache with mod\_php bud you can use .htaccess file. You can specify apache document\_root
by environment variable.

### composer-php7
This package contains installed composer and ins not necessary to use it.

## php5
Just like php7 image ...

### mariadb
This package runs MariaDB. You can specify database data dir, user, password and
database name. Container will create this user with full permitions on everything
and one database for you (only when it doesn't exist). I highly recomend to you 
mount database data dir outside of container.

## Cooperation
This containers cooperates with my other small project called [maker](https://github.com/vojtabiberle/maker).
Maker is small shell script for easier running make with parameters and bunch of Makefiles
and docker-compose files for some PHP projects.