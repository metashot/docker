FROM metashot/base:1.0

ADD VERSION .

ENV VERSION=1.1.2
ENV HMMER_VERSION=3.2.1+dfsg-1

RUN apt-get update

RUN apt-get -y install \
  curl \
  perl \
  hmmer=${HMMER_VERSION}

WORKDIR /usr/local/itsx
RUN curl -s -L https://microbiology.se/sw/ITSx_${VERSION}.tar.gz | \
    tar -zxf - --strip-components=1
ENV PATH="/usr/local/itsx:${PATH}"
WORKDIR /

# Clean 
RUN rm -rf /tmp/* \
  && rm -rf /var/lib/apt/lists/*
