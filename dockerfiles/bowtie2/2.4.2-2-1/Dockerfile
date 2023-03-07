FROM metashot/base:2.0

ADD VERSION .

ENV VERSION=2.4.2-2+b3

ENV SAMTOOLS_VERSION=1.11-1
ENV BEDTOOLS_VERSION=2.30.0+dfsg-1

RUN apt-get update

RUN apt-get -y install \
  perl \
  bowtie2=${VERSION} \
  samtools=${SAMTOOLS_VERSION} \
  bedtools=${BEDTOOLS_VERSION}

RUN rm -rf /tmp/* \
  && rm -rf /var/lib/apt/lists/*
