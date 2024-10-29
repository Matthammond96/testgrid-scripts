docker rm --force podman nosana-node &>/dev/null
kill -9 `pidof podman` &>/dev/null

docker run -d --pull=always --gpus=all --name podman --device /dev/fuse --mount source=podman-cache,target=/var/lib/containers --privileged -e ENABLE_GPU=true -p 8080:8080 nosana/podman:latest podman system service --time 0 tcp:0.0.0.0:8080

docker run --rm --pull=always --network host --interactive -t --volume ~/.nosana/:/root/.nosana/ nosana/nosana-cli:latest node run --url https://matthammond96.github.io/testgrid-scripts/sogni.json 