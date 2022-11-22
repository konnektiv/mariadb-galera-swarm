DATE=$(shell date +%Y-%m-%d)
VERSION_10_3=10.3.37
VERSION_10_4=10.4.27
VERSION_10_5=10.5.18
VERSION_10_6=10.6.11
VERSION_10_7=10.7.7
VERSION_10_8=10.8.6
VERSION_10_11=10.11.1-rc

all: build

build: build-10.3 build-10.4 build-10.5 build-10.6 build-10.7 build-10.8 build-10.11
push: push-10.3 push-10.4 push-10.5 push-10.6 push-10.7 push-10.8 push-10.11

10.3: build-10.3 push-10.3
10.4: build-10.4 push-10.4
10.5: build-10.5 push-10.5
10.6: build-10.6 push-10.6
10.7: build-10.7 push-10.7
10.8: build-10.8 push-10.8
10.11: build-10.11 push-10.11


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

build-10.8:
	docker build --pull -f Dockerfile-10.8 . -t colinmollenhour/mariadb-galera-swarm:$(VERSION_10_8)-$(DATE)
test-10.8:
	./test.sh colinmollenhour/mariadb-galera-swarm:$(VERSION_10_8)-$(DATE)
push-10.8:
	docker push colinmollenhour/mariadb-galera-swarm:$(VERSION_10_8)-$(DATE)

build-10.11:
	docker build --pull -f Dockerfile-10.11 . -t colinmollenhour/mariadb-galera-swarm:$(VERSION_10_11)-$(DATE)
test-10.11:
	./test.sh colinmollenhour/mariadb-galera-swarm:$(VERSION_10_11)-$(DATE)
push-10.11:
	docker push colinmollenhour/mariadb-galera-swarm:$(VERSION_10_11)-$(DATE)

