# Wireguard-centos-docker

## About

This image is for quickly deploy wireguard with docker, based on official centos 7 image, and script modified by some nice guy's project, sorry for copy instead of fork.

* Caution! This build neeed to work with kernel module `kernel-ml-***`, you can check with `rpm -qa|grep kernel-ml|grep $(uname -r)` when has output.

## How to use

1. clone the repo and build by yourself.
1. support define the port environment arg with `--env PORT=1234`
1. need to mount the docker volume or bind the path to get the client config with command `docker run --privileged --cap-add net_admin --cap-add sys_module -v /etc/wireguard:/etc/wireguard -p 3456:3456/udp ${DOCKER-NAME}`
