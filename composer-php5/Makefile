MAINTAINER_NS = vojtabiberle
NAME = composer-php5

files = Dockerfile root/etc/php/5.6/mods-available/essentials.ini root/etc/service/php-fpm/down

build: $(files)
	docker build -t $(MAINTAINER_NS)/$(NAME) .

run:
	docker run --rm -i -t  $(MAINTAINER_NS)/$(NAME) /sbin/my_init -- /sbin/setuser webapp /usr/bin/composer --help

tag:
	docker tag $(MAINTAINER_NS)/$(NAME) $(MAINTAINER_NS)

push:
	docker push $(MAINTAINER_NS)/$(NAME)
