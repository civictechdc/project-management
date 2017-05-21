FROM postgres:9.5
LABEL maintainer "codefordc"


COPY ./init-data.sh /docker-entrypoint-initdb.d/init-data.sh

COPY ./data.dump /home/data/data.dump