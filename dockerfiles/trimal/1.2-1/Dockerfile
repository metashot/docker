FROM metashot/base:2.0

ADD VERSION .

ENV VERSION=1.2

RUN apt-get update

RUN apt-get -y install \
  curl \
  build-essential

WORKDIR /usr/local/trimal
RUN curl -s -L http://trimal.cgenomics.org/_media/trimal.v1.2rev59.tar.gz | \
    tar -zxf - --strip-components=1
WORKDIR /usr/local/trimal/source
RUN make
ENV PATH="/usr/local/trimal/source:${PATH}"
WORKDIR /

# Clean 
RUN rm -rf /tmp/* \
  && rm -rf /var/lib/apt/lists/*
