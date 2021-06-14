FROM metashot/base:1.0

ADD VERSION .

ENV SAMTOOLS_VERSION=1.9-4

ENV VERSION=2.3.4.3-1


RUN apt-get update

RUN apt-get -y install \
  perl \
  bowtie2=${VERSION} \
  samtools=${SAMTOOLS_VERSION} \

RUN rm -rf /tmp/* \
  && rm -rf /var/lib/apt/lists/*
