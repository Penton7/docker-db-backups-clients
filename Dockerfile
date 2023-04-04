ARG ALPINE_VERSION=3.15
FROM alpine:${ALPINE_VERSION}

ARG MARIADB_VERSION=~10.6
RUN apk add --no-cache \
    mysql-client=${MARIADB_VERSION} \
    postgresql-client \
    mongodb-tools

RUN apk add --no-cache \
        python3 \
        py3-pip \
    && pip3 install --upgrade pip \
    && pip3 install --no-cache-dir \
        awscli \
    && rm -rf /var/cache/apk/*


WORKDIR /tmp/db-backup/