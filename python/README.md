# Code for DC Python
The Docker image created by this Dockerfile provides a copy of miniconda](), a package management system 
and environment management system that is a common way to install and use Python. It lets you specify
any version of Python, as well as the packages you want to use with it. 

This Dockerfile automatically creates a virtual environment within the installation using the contents
of the `environment.yml` file stored in the same directory. By adding additional Python packages 
to the list in the environment.yml, either by exporting an environment or by editing the file directly. 
Read about [how conda environments work here](https://conda.io/docs/user-guide/tasks/manage-environments.html).

Using this image allows contributors to run Python code without installing Python, and to have an
up-to-date copy of the virtual environment without maintaining it themselves. 

## Usage

Assuming you are using the docker-compose.yml file to manage this container alongside any other containers
you may be using, you can use the following commands to run this Docker container.

* From the folder that has the docker-compose.yml file (i.e. the project root directory), run `docker-compose up -d`. 
The first time this is run, it will build and run the containers listed in the compose file, including this one. 


* `docker-compose exec sandbox bash` allows you access to the command prompt of the docker container that is running
the Python/miniconda instance. `sandbox` is the name specified in docker-compose - if you have edited it, change the
command accordingly. 
* `cd /repo` to move into the folder containing the code. Assuming that docker-compose.yml is stored in the root of 
your project repository, this will be a copy of the whole project repo
* `cd python` to move into the python folder
* `python codefordcme.py` to execute the 'codefordc.py' script in this repository. You can execute any other script desired
in the same way. 
* press `ctrl+p` and then `ctrl+q` to exit out of the container terminal and return to your normal terminal
* `docker-compose stop` ends all the compose processes. 

## Updating environment.yml
Any time you edit the environment.yml, you will need to tell Docker to rebuild the container image with the new packages
installed. To do this, from the folder with the docker-compose file:

* `docker-compose down`
* `docker-compose build`
* `docker-compose up -d`

Note, you can also run conda commands for managing your virtual environment directly from within the container as well. 