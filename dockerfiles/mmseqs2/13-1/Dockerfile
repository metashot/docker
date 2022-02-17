FROM metashot/base:2.0

ADD VERSION .

ENV VERSION=13-45111

RUN apt-get update
RUN apt-get -y install \
  curl

WORKDIR /usr/local/mmseqs2
RUN curl -s -L https://github.com/soedinglab/MMseqs2/releases/download/${VERSION}/mmseqs-linux-sse41.tar.gz | \
  tar -zxf - --strip-components=1
WORKDIR /
ENV PATH="/usr/local/mmseqs2/bin:${PATH}"

RUN rm -rf /tmp/* \
  && rm -rf /var/lib/apt/lists/*
