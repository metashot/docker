FROM metashot/base:1.0

ADD VERSION .

ENV VERSION=2.0.6
# tRNAscan-SE 2.0 requires separate installation of Infernal 1.1.2.
ENV INFERNAL_VERSION=1.1.2-2 

RUN apt-get update

RUN apt-get -y install \
  curl \
  build-essential \
  infernal=${INFERNAL_VERSION}

# install tRNAscan-SE
RUN mkdir /tmp/trnascan-se
WORKDIR /tmp/trnascan-se
RUN curl -s -L https://github.com/UCSC-LoweLab/tRNAscan-SE/archive/v${VERSION}.tar.gz | \
    tar -zxf - --strip-components=1
RUN ./configure --prefix=/usr/local
RUN make && make install
WORKDIR /

# Clean 
RUN rm -rf /tmp/* \
  && rm -rf /var/lib/apt/lists/*
