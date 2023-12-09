#!/bin/bash
set -e
IMAGE=${1?"Usage: $0 IMAGE_NAME"}

if [[ $IMAGE != "--cleanup" ]]; then
    docker network create cm-galera-test

    docker run -d --name cm-galera-test-seed --network cm-galera-test --network-alias seed \
      -e XTRABACKUP_PASSWORD=foobar \
      -e SKIP_TZINFO=1 \
      $IMAGE seed --log-bin=mysqld-bin

    sleep 5
    docker logs cm-galera-test-seed
    docker run -d --name cm-galera-test-node1 --network cm-galera-test \
      -e XTRABACKUP_PASSWORD=foobar \
      -e SKIP_TZINFO=1 \
      -e GCOMM_MINIMUM=1 \
      $IMAGE node seed --log-bin=mysqld-bin
    sleep 5
    docker logs cm-galera-test-node1
    docker run --name cm-galera-test-node2 --network cm-galera-test \
      -e XTRABACKUP_PASSWORD=foobar \
      -e SKIP_TZINFO=1 \
      -e GCOMM_MINIMUM=1 \
      $IMAGE node seed,node1 --log-bin=mysqld-bin
fi
if [[ -z $SKIP_CLEANUP ]]; then
    echo "Cleaning up..."
    set +e
    docker stop cm-galera-test-seed
    docker rm -v cm-galera-test-seed
    docker stop cm-galera-test-node1
    docker rm -v cm-galera-test-node1
    docker stop cm-galera-test-node2
    docker rm -v cm-galera-test-node2
    docker network rm cm-galera-test
fi
