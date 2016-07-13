MAINTAINER_NS = vojtabiberle
NAME = mariadb

files = Dockerfile

build: $(files)
	docker build -t $(MAINTAINER_NS)/$(NAME) .

run:
	docker run --rm -i -t -p 3306:3306  $(MAINTAINER_NS)/$(NAME) /sbin/my_init -- bash -l

tag:
	docker tag $(MAINTAINER_NS)/$(NAME)

push:
	docker push $(MAINTAINER_NS)/$(NAME)
