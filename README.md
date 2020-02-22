# aws-cli-docker

[![Docker build](https://img.shields.io/docker/cloud/build/brainstation/aws-cli?label=build&logo=docker)](https://hub.docker.com/r/brainstation/aws-cli/builds)
![Docker Pulls](https://img.shields.io/docker/pulls/brainstation/aws-cli.svg?label=pulls&logo=docker)

A python docker image with AWS CLI installed.

[Docker Hub](https://hub.docker.com/r/brainstation/aws-cli)

Tags of this project represent the release tags of [aws-cli](https://github.com/aws/aws-cli). Whenever there is a new release tag available in [aws-cli](https://github.com/aws/aws-cli), the `latest` will be updated and the new tag will be added **within an hour**.

```shell
docker run --rm -it brainstation/aws-cli aws --version
```

As this image is mainly useful in a CI context, [jq](https://stedolan.github.io/jq/) is also provided in it, to parse some awscli response.

## Usage example

docker-compose.yml
```yml
version: '3'
services:
  who-am-i-1:
    image: brainstation/aws-cli:latest
    working_dir: /opt/code
    volumes:
      - .:/opt/code
      - $HOME/.aws:/root/.aws
    command: ./task.sh

  who-am-i-2:
    image: brainstation/aws-cli:latest
    volumes:
      - $HOME/.aws:/root/.aws
    command: bash -c -e "
      aws sts get-caller-identity &&
      echo \"Hello World!\"
      "
```

task.sh
```bash
#!/usr/bin/env bash

UserId=$(aws sts get-caller-identity | jq -r '.UserId')
echo "My user id: $UserId"
```

To be able to try this example you need to have valid credentials in `~/.aws/credentials` on your host machine. To set it up, you may follow the instruction [here](https://github.com/aws/aws-cli#getting-started).

```bash
$ docker-compose run --rm who-am-i-1
My user id: ABCDEFG3H5IJK4NXYAYJ4
$ docker-compose run --rm who-am-i-2
{
    "UserId": "<user id>",
    "Account": "<account number>",
    "Arn": "<user or role arn>"
}
Hello World!
```
