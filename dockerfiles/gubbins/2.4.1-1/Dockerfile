FROM metashot/base:1.0

ADD VERSION .

ENV VERSION=2.4.1
ENV RAXML_VERSION=8.2.12+dfsg-1
ENV FASTTREE_VERSION=2.1.10-2
ENV IQTREE_VERSION=1.6.9+dfsg-1


RUN apt-get update
RUN apt-get install -y \
    curl \
    tar \
    build-essential \
    autoconf \
    automake \
    pkg-config \
    zlib1g-dev \
    python3 \
    python3-pip \
    raxml=${RAXML_VERSION} \
    fasttree=${FASTTREE_VERSION} \
    iqtree=${IQTREE_VERSION}

RUN pip3 install \
  "dendropy>= 4.0" \
  "biopython> 1.59"

WORKDIR /tmp/gubbins
RUN curl -s -L https://github.com/sanger-pathogens/gubbins/archive/v${VERSION}.tar.gz | \
  tar -zxf - --strip-components=1
RUN autoreconf -i \
  && ./configure \
  && make \
  && make install \
  && cd python \
  && python3 setup.py install
WORKDIR /
ENV LD_LIBRARY_PATH='/usr/local/lib'

RUN rm -rf /tmp/* \
  && rm -rf /var/lib/apt/lists/*
