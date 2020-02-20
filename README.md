# aws-cli-docker

[![Docker build](https://img.shields.io/docker/cloud/build/brainstation/aws-cli?label=build&logo=docker)](https://hub.docker.com/r/brainstation/aws-cli/builds)
![Docker Pulls](https://img.shields.io/docker/pulls/brainstation/aws-cli.svg?label=pulls&logo=docker)

A python docker image with AWS CLI installed.

```shell
docker run --rm -it brainstation/aws-cli aws --version
```

As this image is mainly useful in a CI context, [jq](https://stedolan.github.io/jq/) is also provided in it, to parse some awscli response.
