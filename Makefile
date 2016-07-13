#SUBDIRS := $(wildcard */.)
# I need to specify order
SUBDIRS := php7 composer apache-php7 mariadb

all: $(SUBDIRS)

$(SUBDIRS):
	$(MAKE) -C $@ build

.PHONY: all $(SUBDIRS)
