FROM metashot/base:1.0

ADD VERSION .

ENV VERSION=3.12.0+dfsg-2

RUN apt-get update
RUN apt-get install -y \
  roary=${VERSION}

RUN rm -rf /tmp/* \
  && rm -rf /var/lib/apt/lists/*
