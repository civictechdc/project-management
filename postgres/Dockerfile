FROM postgres
MAINTAINER mkalish


COPY ./init-data.sh /docker-entrypoint-initdb.d/init-data.sh

COPY ./data.dump /home/data/data.dump