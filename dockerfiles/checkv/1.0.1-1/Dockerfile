FROM metashot/base:2.0

ADD VERSION .

ENV PRODIGAL_GV_VERSION=2.9.0
ENV HMMER_VERSION=3.3.2+dfsg-1

ENV VERSION=1.0.1

RUN apt-get update

# pysam specific: libbz2-dev zlib1g-dev liblzma-dev bzip2 
RUN apt-get -y install \
  curl \
  unzip \
  python3 \
  python3-pip \
  build-essential \
  hmmer=${HMMER_VERSION}

COPY diamond .
RUN mv diamond /usr/local/bin

# install prodigal_gv
WORKDIR /usr/local/prodigal_gv
RUN curl -s -L https://github.com/apcamargo/prodigal-gv/archive/refs/tags/${PRODIGAL_GV_VERSION}.tar.gz | \
    tar -zxf - --strip-components=1
RUN make
WORKDIR /
ENV PATH="/usr/local/prodigal_gv:${PATH}"

RUN pip3 install "checkv== ${VERSION}"

RUN rm -rf /tmp/* \
  && rm -rf /var/lib/apt/lists/*
