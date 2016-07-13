MAINTAINER_NS = vojtabiberle
NAME = apache-php7

files = Dockerfile root/etc/php/7.0/mods-available/essentials.ini

build: $(files)
	docker build -t $(MAINTAINER_NS)/$(NAME) .

run:
	docker run --rm -i -t -p 80:80  $(MAINTAINER_NS)/$(NAME) /sbin/my_init -- bash -l

tag:
	docker tag $(MAINTAINER_NS)/$(NAME) $(MAINTAINER_NS)

push:
	docker push $(MAINTAINER_NS)/$(NAME)
