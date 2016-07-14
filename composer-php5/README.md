# composer-php5
Container for running composer comands like this: `docker run --rm -i -t vojtabiberle/composer-php5 /sbin/my_init --skip-startup-files --quiet -- /sbin/setuser webapp /usr/bin/composer`
This is not so much helpful, but with [maker](https://github.com/vojtabiberle/maker) it will make much more sense.
In this container is removed xdebug and php-fpm.

## Environment variables
### COMPOSER_HOME
Is here changed to /composer so you can mount your ~/.composer folder to /composer inside container and share everything (include credentials).

### COMPOSER_ALLOW_SUPERUSER
Is here set to true, so you can run composer as root withouth warning.

All other variables are same as in [php5](https://github.com/vojtabiberle/docker-images/php5) container.