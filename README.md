# aws-cli-docker

[![Docker build](https://img.shields.io/docker/cloud/build/brainstation/aws-cli?label=build&logo=docker)](https://hub.docker.com/r/brainstation/aws-cli/builds)
![Docker Pulls](https://img.shields.io/docker/pulls/brainstation/aws-cli.svg?label=pulls&logo=docker)

A python docker image with AWS CLI installed.

Tags of this project represent the release tags of [aws-cli](https://github.com/aws/aws-cli). Whenever there is a new release tag available in [aws-cli](https://github.com/aws/aws-cli), the `latest` will be updated and the new tag will be added **within an hour**.

```shell
docker run --rm -it brainstation/aws-cli aws --version
```

As this image is mainly useful in a CI context, [jq](https://stedolan.github.io/jq/) is also provided in it, to parse some awscli response.
