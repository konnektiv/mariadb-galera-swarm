DATE=$(shell date +%Y-%m-%d)
VERSION_10_5=10.5.27
VERSION_10_6=10.6.20
VERSION_10_11=10.11.10

all: build

build: build-10.5 build-10.6 build-10.11
push: push-10.5 push-10.6 push-10.11

10.5: build-10.5 push-10.5
10.6: build-10.6 push-10.6
10.11: build-10.11 push-10.11


build-10.5:
	docker build --pull -f Dockerfile-10.5 . -t colinmollenhour/mariadb-galera-swarm:$(VERSION_10_5)-$(DATE)
test-10.5:
	./test.sh colinmollenhour/mariadb-galera-swarm:$(VERSION_10_5)-$(DATE)
push-10.5:
	docker push colinmollenhour/mariadb-galera-swarm:$(VERSION_10_5)-$(DATE)

build-10.6:
	docker build --pull -f Dockerfile-10.6 . -t colinmollenhour/mariadb-galera-swarm:$(VERSION_10_6)-$(DATE)
test-10.6:
	./test.sh colinmollenhour/mariadb-galera-swarm:$(VERSION_10_6)-$(DATE)
push-10.6:
	docker push colinmollenhour/mariadb-galera-swarm:$(VERSION_10_6)-$(DATE)

build-10.11:
	docker build --pull -f Dockerfile-10.11 . -t colinmollenhour/mariadb-galera-swarm:$(VERSION_10_11)-$(DATE)
test-10.11:
	./test.sh colinmollenhour/mariadb-galera-swarm:$(VERSION_10_11)-$(DATE)
push-10.11:
	docker push colinmollenhour/mariadb-galera-swarm:$(VERSION_10_11)-$(DATE)

