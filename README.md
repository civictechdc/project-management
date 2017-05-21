# Project Management

## Notes on Docker
Please make sure to grab the most recent Docker Communitiy Edition for your operating system*.

### Linux/Mac
To get started download [Docker](https://www.docker.com/community-edition#/download)

### Windows
Please use [docker toolbox](https://docs.docker.com/toolbox/overview/)


## Logging into Docker Hub
If you don't already have an account you can register for one at [Docker Hub](https://hub.docker.com/).

To login run: `docker login` and follow the prompts.  You are no logged in!

## Publishing Images
Once you have built the image you would like to publish, run `docker publish codefordc2/{youimage}`


## Docker Toolbox
Windows Home edition does not support docker natively, so VirtualBox is used to create an environment for the docker daemon. [Here](https://docs.docker.com/machine/install-machine/)

<strong>Note:</strong> The other READMEs will always refer to the IP address to use as `localhost` or `127.0.0.1`.  When using docker-machine you will need to use the IP address of the virtual machine.  To do so run `docker-machine ip
