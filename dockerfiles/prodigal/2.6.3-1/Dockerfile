FROM metashot/base:1.0

ADD VERSION .

ENV VERSION=1:2.6.3-4

RUN apt-get update

RUN apt-get -y install \
  prodigal=${VERSION}

RUN rm -rf /tmp/* \
  && rm -rf /var/lib/apt/lists/*
