DATE=$(shell date +%Y-%m-%d)
VERSION_10_2=10.2.44
VERSION_10_3=10.3.35
VERSION_10_4=10.4.25

all: build

build: build-10.2 build-10.3 build-10.4
push: push-10.2 push-10.3 push-10.4

10.2: build-10.2 push-10.2
10.3: build-10.3 push-10.3
10.4: build-10.4 push-10.4


build-10.2:
	docker build --pull -f Dockerfile-10.2 . -t colinmollenhour/mariadb-galera-swarm:$(VERSION_10_2)-$(DATE)
test-10.2:
	./test.sh colinmollenhour/mariadb-galera-swarm:$(VERSION_10_2)-$(DATE)
push-10.2:
	docker push colinmollenhour/mariadb-galera-swarm:$(VERSION_10_2)-$(DATE)


build-10.3:
	docker build --pull -f Dockerfile-10.3 . -t colinmollenhour/mariadb-galera-swarm:$(VERSION_10_3)-$(DATE)
test-10.3:
	./test.sh colinmollenhour/mariadb-galera-swarm:$(VERSION_10_3)-$(DATE)
push-10.3:
	docker push colinmollenhour/mariadb-galera-swarm:$(VERSION_10_3)-$(DATE)


build-10.4:
	docker build --pull -f Dockerfile-10.4 . -t colinmollenhour/mariadb-galera-swarm:$(VERSION_10_4)-$(DATE)
test-10.4:
	./test.sh colinmollenhour/mariadb-galera-swarm:$(VERSION_10_4)-$(DATE)
push-10.4:
	docker push colinmollenhour/mariadb-galera-swarm:$(VERSION_10_4)-$(DATE)
