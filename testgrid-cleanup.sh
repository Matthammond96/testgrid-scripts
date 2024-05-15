#!/bin/bash

docker rm --force podman nosana-node
docker system prune -a -f
docker volume prune -a -f
docker image prune -a -f
docker image rm nosana/nosana-cli -f
docker image rm nosana/podman -f

if cat /proc/version | grep -q 'WSL2'; then
  podman system prune
fi