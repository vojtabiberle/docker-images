# apache-php5
In this container is added apache2.4 with mpm-event and linked with php5.6-fpm.

## Volumes
One volume $WEBAPP_DIR

## Ports
80 443

virtualhost on port 443 is disabled

## Environment variables

### APACHE_DOCUMENTROOT
Path of apache document root. Default is same as WEBAPP_DIR from [php5]{/vojtabiberle/docker-images/php5} container
but when you want document root in subdirectory, is here really easy way to do it.

 All other variables are same as in [php5](https://github.com/vojtabiberle/docker-images/php5) container.