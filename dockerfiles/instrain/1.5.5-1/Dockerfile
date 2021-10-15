FROM metashot/base:2.0

ADD VERSION .

ENV VERSION=1.5.5

ENV SAMTOOLS_VERSION=1.11-1
ENV PRODIGAL_VERSION=1:2.6.3-4

RUN apt-get update

RUN apt-get -y install \
  python3 \
  python3-pip \
  pkg-config \
  libhdf5-dev \
  llvm-dev \
  samtools=${SAMTOOLS_VERSION} \
  prodigal=${PRODIGAL_VERSION}

RUN pip3 install "instrain== ${VERSION}" 

RUN rm -rf /tmp/* \
  && rm -rf /var/lib/apt/lists/*
