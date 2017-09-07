# Project Management

This repo provides boilerplate project code to help jumpstart new projects. To date, we have focused on
setting up Docker images for projects to help speed up their onboarding process. 

## Folders
Each folder contains relevant Dockerfiles and code for setting up that particular tool or language
within a Docker container. See each folder for more detailed information

## Docker Compose
Since many projects may need more than one software, it is often useful to run the containers using
a single docker-compose file. Even if you need only one container, you can still use docker-compose. 
As such, you should usually try running the images using docker-compose as your first approach. 

This root folder contains a single `docker-compose.yml` file that is configured for the structure
of this project management repository. To get started using this file, you can copy the file into 
your project and delete the sections that you don't need. Many of the sections of compose, however,
expect this folder structure and expect to find the `Dockerfile`s that are located in each of the 
subfolders. When this is the case, look for the 'context' setting, which specifies the subfolder
where docker-compose will look for these files. Copy any appropriate `Dockerfile` into a subfolder
of your project, and then edit the `context` to match the name. 

For example, if you wanted to use the Python Docker image, and wanted to store your Python code
in a folder of your project called `src`, you would:
- Copy the `Dockerfile` and `environment.yml` from the /python folder into your /src folder
- Edit the relevant portion of `docker-compose.yml` to look like this:

    ```
    sandbox:
        build:
            context: src #used to be python
    ```

To run the docker-compose file and build/start all the containers listed in it, use:
* `docker-compose up -d` to start in detached mode (containers run in the background)
* `docker-compose stop` to end the processes

## Notes on Docker
Please make sure to grab the most recent Docker Communitiy Edition for your operating system*.

### Linux/Mac
To get started download [Docker](https://www.docker.com/community-edition#/download)

### Windows
Please use [docker toolbox](https://docs.docker.com/toolbox/overview/)


## Logging into Docker Hub
If you don't already have an account you can register for one at [Docker Hub](https://hub.docker.com/).

To login run: `docker login` and follow the prompts.

## Publishing Images
Once you have built the image you would like to publish, run `docker publish codefordc2/{youimage}`

## Docker Toolbox
Windows Home edition does not support docker natively, so VirtualBox is used to create an environment for the docker daemon. [Here](https://docs.docker.com/machine/install-machine/)

<strong>Note:</strong> The other READMEs will always refer to the IP address to use as `localhost` or `127.0.0.1`.  When using docker-machine you will need to use the IP address of the virtual machine.  To do so run `docker-machine ip`

## Other useful commands

* `docker ps` lists all running containers
* `docker-compose up` starts all containers in the docker-compose.yml file. Add ` -d` to run in detached mode (get your command prompt back)
* `docker-compose stop` stops running containers
* `docker-compose down` then `docker-compose build` rebuilds containers from scratch (useful if one gets corrupted, if you change settings such as in the Python environment.yml file)
