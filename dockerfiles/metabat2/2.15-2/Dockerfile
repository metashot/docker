FROM metashot/base:2.0

ADD VERSION .

ENV VERSION=2.15
ENV SAMTOOLS_VERSION=1.11-1
ENV BOWTIE2_VERSION=2.5.1

RUN apt-get update

RUN apt-get -y install \
  curl \
  unzip \
  libgomp1 \
  build-essential \
  autoconf \
  libboost-all-dev \
  libncurses5-dev \
  zlib1g-dev \
  cmake \
  git \
  perl \
  samtools=${SAMTOOLS_VERSION}

WORKDIR /usr/local/bowtie2
RUN curl -s -L https://github.com/BenLangmead/bowtie2/releases/download/v${BOWTIE2_VERSION}/bowtie2-${BOWTIE2_VERSION}-linux-x86_64.zip -o bowtie2.zip; \
  unzip -j bowtie2.zip; \
  rm -rf bowtie2.zip
WORKDIR /
ENV PATH="/usr/local/bowtie2:${PATH}"

RUN mkdir -p /usr/local/metabat2
WORKDIR /usr/local/metabat2
RUN curl -s -L https://bitbucket.org/berkeleylab/metabat/get/v${VERSION}.tar.gz | \
    tar -zxf - --strip-components=1
    
RUN mkdir build \
    && cd build \
    && cmake -DCMAKE_INSTALL_PREFIX=/usr/local .. \
    && make \
    && make install \
    && cd .. \
    && rm -rf build

WORKDIR /

RUN rm -rf /tmp/* \
  && rm -rf /var/lib/apt/lists/*

