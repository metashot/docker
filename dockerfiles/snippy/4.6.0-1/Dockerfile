FROM metashot/base:1.0

ADD VERSION .

ENV VERSION=4.6.0

RUN apt-get update
RUN apt-get install -y \
  build-essential \
  default-jre \
  curl \
  bioperl \
  cpanminus \
  parallel

RUN cpanm --force Bio::Perl

RUN mkdir -p /usr/local/snippy
WORKDIR /usr/local/snippy
RUN curl -s -L https://github.com/tseemann/snippy/archive/v${VERSION}.tar.gz | \
    tar -zxf - --strip-components=1
WORKDIR /
ENV PATH="/usr/local/snippy/bin/:$PATH"
RUN snippy --check

RUN rm -rf /tmp/* \
  && rm -rf /var/lib/apt/lists/*
