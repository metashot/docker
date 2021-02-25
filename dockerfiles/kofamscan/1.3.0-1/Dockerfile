FROM metashot/base:1.0

ADD VERSION .

ENV VERSION=1.3.0
ENV HMMER_VERSION=3.2.1+dfsg-1

RUN apt-get update

RUN apt-get -y install \
  curl \
  tar \
  ruby \
  hmmer=${HMMER_VERSION} \
  parallel

WORKDIR /kofamscan
RUN curl -s -L https://github.com/takaram/kofam_scan/archive/v${VERSION}.tar.gz | \
    tar -zxf - --strip-components=1
WORKDIR /
RUN ln -s /kofamscan/exec_annotation /usr/local/bin/

RUN rm -rf /tmp/* \
  && rm -rf /var/lib/apt/lists/*
