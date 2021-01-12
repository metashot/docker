FROM metashot/base:1.0

ADD VERSION .

ENV PRODIGAL_VERSION=1:2.6.3-4
ENV DIAMOND_VERSION=2.0.4

ENV VERSION=1.0.1

RUN apt-get update

RUN apt-get -y install \
  curl \
  unzip \
  python3 \
  python3-pip \
  prodigal=${PRODIGAL_VERSION}

WORKDIR /usr/local/bin
RUN curl -s -L https://github.com/bbuchfink/diamond/releases/download/v2.0.4/diamond-linux64.tar.gz | \
  tar -zxf -
WORKDIR /

RUN pip3 install "gunc== ${VERSION}"

RUN rm -rf /tmp/* \
  && rm -rf /var/lib/apt/lists/*
