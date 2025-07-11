DATE=$(shell date +%Y-%m-%d)
VERSION_10_5=10.5.27
VERSION_10_11=10.11.10
VERSION_11_8=11.8.2
MAINTAINER=konnektiv

all: build

build: build-10.5 build-10.11 build-11.8
push: push-10.5 push-10.11 push-11.8

10.5: build-10.5 push-10.5
10.11: build-10.11 push-10.11
11.8: build-11.8 push-11.8


build-10.5:
	docker build --pull -f Dockerfile-10.5 . -t $(MAINTAINER)/mariadb-galera-swarm:$(VERSION_10_5)-$(DATE)
test-10.5:
	./test.sh $(MAINTAINER)/mariadb-galera-swarm:$(VERSION_10_5)-$(DATE)
push-10.5:
	docker push $(MAINTAINER)/mariadb-galera-swarm:$(VERSION_10_5)-$(DATE)

build-10.11:
	docker build --pull -f Dockerfile-10.11 . -t $(MAINTAINER)/mariadb-galera-swarm:$(VERSION_10_11)-$(DATE)
test-10.11:
	./test.sh $(MAINTAINER)/mariadb-galera-swarm:$(VERSION_10_11)-$(DATE)
push-10.11:
	docker push $(MAINTAINER)/mariadb-galera-swarm:$(VERSION_10_11)-$(DATE)

build-11.8:
	docker build --pull -f Dockerfile-11.8 --build-arg MARIADB_VERSION=$(VERSION_11_8) . -t $(MAINTAINER)/mariadb-galera-swarm:$(VERSION_11_8)-$(DATE)
test-11.8:
	./test.sh $(MAINTAINER)/mariadb-galera-swarm:$(VERSION_11_8)-$(DATE)
push-11.8:
	docker push $(MAINTAINER)/mariadb-galera-swarm:$(VERSION_11_8)-$(DATE)
