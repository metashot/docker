FROM metashot/base:1.0

ADD VERSION .

ENV VERSION=2.5.1

RUN apt-get update
RUN apt-get install -y \
    curl \
    tar \
    build-essential \
    autoconf \
    automake \
    pkg-config \
    libtool \
    zlib1g-dev

WORKDIR /tmp/snp-sites
RUN curl -s -L https://github.com/sanger-pathogens/snp-sites/archive/v${VERSION}.tar.gz | \
  tar -zxf - --strip-components=1
RUN autoreconf -i \
  && ./configure \
  && make \
  && make install
WORKDIR /
ENV LD_LIBRARY_PATH='/usr/local/lib'

RUN rm -rf /tmp/* \
  && rm -rf /var/lib/apt/lists/*
