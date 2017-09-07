# Code for DC Jekyll

In order to help projects jumpstart, we've created two docker files and the corresponding
documentation on how to use them.  Jekyll is a great tool that will allow teams to
quickly get of the ground by building a jekyll site locally and then serving it via github pages.

## What is Jekyll?

Jekyll in the simplest terms is an open source blogging platform.  The longer story is that it is an
excellent tool for generating complicated static sites out of markdown and html.  The best part is that it is directly integrated
into github pages which means they handle the work of generating the site and serving it, making it great,
free tool for projects.  For more information vist [jekyll's documentatin](https://jekyllrb.com/)

Jekyll is written in ruby and built using bundler and though jekyll is incredibly easy to work with, these 
tools sometimes are not.  Different versions of ruby, wrong installation directory for gems and incorrect sudo
use can all cause errors when trying to install jekyll, build and edit a site. This directory contains two different
Dockerfiles; one is used to generate a new jekyll site from scratch in the directory of your choosing.  The other image
lets you view an existing Jekyll site in your browser as you edit it. 

### Builder
If you don't have a Jekyll site yet, jumpstart your project by building one from this image. 
The image has been published here https://hub.docker.com/r/codefordc2/jekyll-starter/ so that you 
do not have to build it locally.

#### Usage (docker must be installed)

Steps
1. Run `docker pull codefordc2/jekyll-starter:release`
2. Docker will pull down the image (warning on bad internet this might take a few minutes)
3. Create a directory where you would like the site to live, i.e. `mkdir my-jekyll-site`
    - alternatively you can use an existing directory, this can be good if you already have a repository
4. Run `docker run --volume $(pwd):/home/jekyll  codefordc2/jekyll-starter:release`
    - `--volume $(pwd):/home/jekyll` tells docker to use the current directory as the install location
    - This command will create a new directory `docs` where the site will live
    - __WARNING:__ if `docs` already exists in the directory, it will be overwritten
5. Thats it, a new jekyll site has been created.  For steps on serving it locally please see _SERVE_ section below
6. (Optional) If you are inside an existing github repository, commit the new `docs` and navigate to
the repository's setting page on github.com.  In the _Github Pages_ section, set the source to
`master branch docs/ folder` and your site will be availbe at https://{github user or organization}.github.io/{repo name}


#### Serving

The second image is used for running an existing Jekyll site in your browser (such as the one you just built), and regenerating the site any time you save changes to the code. 
    1. Copy `jekyll/Dockerfile` into the root of your repository where the jekyll site was installed
    2. Run `docker build . -t {jekyll_mysite}` (substitute the name of your repository for 'mysite')
    3. Run `docker-machine ip`. Make a note of this ip address (often something like 192.168.99.100). 
    3. Run `docker run --volume $(pwd)/docs:/srv/jekyll -p 4000:4000 {jekyll_mysite}`
    4. You're site will now be running and you can access it at http://{your-ip}:4000 (substituting the ip from step 3). 

When you save a file, the website will be rebuilt and you can view the changes by refreshing the page. Unfortunately, depending on which operating system you're using and which version of Docker you have, Docker is sometimes much slower to recognize changes to files and execute the rebuild. This can make it much more inefficient to use Docker for day-to-day development. To make sure that your changes are being reloaded, you should watch the command line output of the container that is running Jekyll. 

When you save a file, watch the command prompt to see when the changes are reflected - note that refreshing the page in your browser will not show the changes until the `done in XX seconds.` portion of the message is shown. 

**If you are using docker-compose or docker run in detached mode (`-d`)**
In this case, you'll need to do some steps to see the output of the Jekyll container:

    5. Run `docker ps` to view a list of the currently running containers. You should see something like this:
        ```
        CONTAINER ID        IMAGE               ...  PORTS                    NAMES
        6767fbc67457        jekyll_mysite       ...  0.0.0.0:4000->4000/tcp   jekyll_mysite_1
        ```
    6. Find the name of the jekyll container - in this case it is `jekyll_mysite_1`. You can also use the container id
    7. Run `docker logs -f jekyll_mysite_1` to view the realtime output of the container. 
    8. Visit `localhost:4000` or `<your-docker-ip>:/4000` in your web browser, where `<your-docker-ip>` is the ip address of the docker container ()
    9. When you want your command prompt back (without stopping Docker or Jekyll), type `ctrl+c` in the terminal window. 


## Notes and Troubleshooting
- If you have long delays in running your file, you may want to [install Jekyll directly](https://jekyllrb.com/docs/installation/). 
- If you have issues installing gems, one possible solution is to add source 'https://rubygems.org' to your Gemfile