# php7

This is base container for apache-php7 and composer container. It runs inside 
php-fpm and you can use it, if you want webserver running in different container.
I think, webserver and php-fpm are one service, so I created apache-php7 container.

In image are almost all php libraries from Ubuntu repositories.

This container don't expose any port and php-fpm don't listen on TCP connections,
but you can always map `/run/php/php7.0-fpm.sock`.

## Volumes
One volume $WEBAPP_DIR

## Environment variables
### WEBAPP_DIR
Root path of web application. Default /var/www/website. If you change it, don't forgot to create
path in container. This path is exported as VOLUME.

### WEBAPP_USER
Username of newly created user. You can change it to whatever. It's only for container.

### WEBAPP_UID
ID of newly created user. I recommend you to set it to your own user ID on your PC.
By this small trick you don't have to solve file ownership issues.

### WEBAPP_GROUP
Name of newly created group. You can again change it to whatever you want, it's only for container.

### WEBAPP_GID
And again I recommended you to set to your own group ID on your PC.
Reasons are same as for WEBAPP_UID.

## Files
Whole root directory are mapped to / in container. This means adding new files ale really easy.
If you want to change some files, first look, if you can't do same stuff with adding new file.
For example some service looking in directory for additional configuration files.

### PHP parameters
There is file root/etc/php/7.0/mods-available/essentials.ini where you can modify all php parameters.
This file is added by new configuration file to all php environments so you can rewrite default parameters.