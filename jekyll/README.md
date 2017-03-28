# Code for DC Jekyll

In order to help projects jumpstart, we've created two docker files and the corresponding
documentation on how to use them.  Jekyll is a great tool that will allow teams to
quickly get of the ground by building a jekyll site locally and then serving it via github pages.

## What is Jekyll?

Jekyll in the simplest terms is an open source blogging platform.  The longer story is that it is an
excellent tool for generating complicated static sites out of markdown and html.  The best part is that it is directly integrated
into github pages which means they handle the work of generating the site and serving it, making it great,
free tool for projects.  For more information vist [jekyll's documentatin](https://jekyllrb.com/)

## Project Structure

This directory contains two different Dockerfiles; one serves to build a container that operates as a one liner
for generating a new jekyll site from scratch in the directory of your choosing.  The other image is 
setup to serve a jekyll site with a passed in directory of where the site lives.

### Builder

Jekyll is written in ruby and built using bundler and though jekyll is incredibly easy to work with, these 
tools sometimes are not.  Different versions of ruby, wrong installation directory for gems and incorrect sudo
use can all cause errors when trying to install jekyll and build a new site.  This image takes all that
hard work out for you by relying on a docker image that when run will generate the site.

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

The second image in this directory is one that can help serving jekyll with the live reloading.  There are
two options for using it.

1. If your jekyll site is using additional gem plugins, you can use the docker file and build your own image.
    1. Copy `jekyll/Dockerfile` into the root of your repository repository where the jekyll site was installed
    2. Run `docker build . -t codefordc2/{mysite}` (substitute the name of your repository)
    3. Run `docker run --volume $(pwd)/docs:/srv/jekyll -p  127.0.0.1:4000:4000 codefordc2/{mysite}`
    4. You're site will now be running and you can access it at http://127.0.0.1:4000 and all changes will be live reloaded
    - If you have issues installing gems, one possible solution is to add source 'https://rubygems.org' to your Gemfile

2. It can be used out of the box by pulling the image.  Please note this will work only if your jekyll project is only using the vanilla install and does not rely on other plugins that would have been 
installed via gem.  *This will most likely only work for jekyll sites created via the jekyll-builder image.*
    1. Run `docker pull codefordc2/jekyll-serve:release`
    2. Navigate to where you built your jekyll site
    3. Run `docker run --volume $(pwd)/docs:/srv/jekyll -p  127.0.0.1:4000:4000 codefordc2/jekyll-serve`
    4. You're site will now be running and you can access it at http://127.0.0.1:4000 and all changes will be live reloaded








