#!/bin/bash

docker system prune -a -f
docker volume prune -a -f
docker image prune -a -f
docker image rm nosana/nosana-cli -f

if cat /proc/version | grep -q 'WSL2'; then
  podman system prune
fi