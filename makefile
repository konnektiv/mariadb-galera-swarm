DATE=$(shell date +%Y-%m-%d)
VERSION_10_2=10.2.44
VERSION_10_3=10.3.35
VERSION_10_4=10.4.25
VERSION_10_5=10.5.16
VERSION_10_6=10.6.8
VERSION_10_7=10.7.4

all: build

build: build-10.2 build-10.3 build-10.4 build-10.5 build-10.6 build-10.7
push: push-10.2 push-10.3 push-10.4 push-10.5 push-10.6 push-10.7

10.2: build-10.2 push-10.2
10.3: build-10.3 push-10.3
10.4: build-10.4 push-10.4
10.5: build-10.5 push-10.5
10.6: build-10.6 push-10.6
10.7: build-10.7 push-10.7


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

build-10.7:
	docker build --pull -f Dockerfile-10.7 . -t colinmollenhour/mariadb-galera-swarm:$(VERSION_10_7)-$(DATE)
test-10.7:
	./test.sh colinmollenhour/mariadb-galera-swarm:$(VERSION_10_7)-$(DATE)
push-10.7:
	docker push colinmollenhour/mariadb-galera-swarm:$(VERSION_10_7)-$(DATE)

