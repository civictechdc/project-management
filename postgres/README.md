# Code for DC Postgres

This part of the project management repository contains a series of utilities to get a team
up and running with a database locally with minimal effort.  It includes a Dockerfile that 
will copy in a dump of a postgres database and an init file when built and when a container
is created from that image, the database will be initialized with that data.

The second part is a sample docker-compose.yml that will serve as example of how to spin up 
an instance of the postgres database with the data and a postgres web client that can be 
used to manipulate and query the data.

## Getting started with the Postgres Dockerfile

The Dockerfile in this directory extends the official postgres image.  The extension copies
the initial data into the postgres image and when the container is started will load the 
data.

### Steps to get started (assumes you have access to an existing Postgres database)

1. Run `pg_dump --no-owner --no-privileges -F c -f data.dump  --dbname {insert your database}`
    - alternatively you can use the full connection string `pg_dump --no-owner --no-privileges -F c -f data.dump --dbname=postgresql://postgres:postgres@localhost:5433/housinginsights_lo`
2. Copy the file, `data.dump` into this directory.
3. Run `docker build . -t codefordc2/{your-project}-postgres`

Thats it.  You have now created a reusable docker container with your project's data that can
be shared with your team. To run it:

`docker run -p  127.0.0.1:5432:5432 codefordc2/{your-project}-postgres`


## Sample docker-compose.yml
The docker-compose.yml is an example of how to use the created postgres docker image.  To get started:

1. Copy `docker-compose.yml` into your project.
2. Replace `codefordc2/postgres` with the name of you image.
3. Run `docker-compose up`; you'll see your data being inserted.
4. Enter `ctrl-c` to kill the existing process
5. Run `docker-compose up -d`
6. Visit http://localhost:8081 to see your database.
