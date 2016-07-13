MAINTAINER_NS = vojtabiberle
NAME = composer

files = Dockerfile root/etc/php/7.0/mods-available/essentials.ini root/etc/service/php-fpm/down

build: $(files)
	docker build -t $(MAINTAINER_NS)/$(NAME) .

run:
	docker run --rm -i -t  $(MAINTAINER_NS)/$(NAME) /sbin/my_init -- /sbin/setuser webapp /usr/bin/composer --help

tag:
	docker tag $(MAINTAINER_NS)/$(NAME)

push:
	docker push $(MAINTAINER_NS)/$(NAME)
