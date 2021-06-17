FROM metashot/base:1.0

ADD VERSION .

ENV VERSION=2.1.2
ENV BRACKEN_VERSION=2.6.2
ENV KRAKENTOOLS_VERSION=1.2

RUN apt-get update

RUN apt-get -y install \
  curl \
  build-essential \
  python2.7

RUN ln -s /usr/bin/python2.7 /usr/bin/python

ENV KRAKEN2_DIR=/usr/local/kraken2

# install kraken2
WORKDIR /tmp
RUN curl -s -L https://github.com/DerrickWood/kraken2/archive/v${VERSION}.tar.gz | \
    tar -zxf - --strip-components=1
RUN mkdir -p $KRAKEN2_DIR
RUN ./install_kraken2.sh $KRAKEN2_DIR
RUN ln -s $KRAKEN2_DIR/kraken2 $KRAKEN2_DIR/kraken2-build $KRAKEN2_DIR/kraken2-inspect /usr/local/bin
RUN rm -rf /tmp/*

# install bracken
WORKDIR /usr/local/bracken
RUN curl -s -L https://github.com/jenniferlu717/Bracken/archive/v{$BRACKEN_VERSION}.tar.gz | \
    tar -zxf - --strip-components=1
WORKDIR /usr/local/bracken/src
RUN make
ENV PATH="/usr/local/bracken:${PATH}"
WORKDIR /

# install krakentools
WORKDIR /usr/local/krakentools
RUN curl -s -L https://github.com/jenniferlu717/KrakenTools/archive/refs/tags/v${KRAKENTOOLS_VERSION}.tar.gz | \
    tar -zxf - --strip-components=1
RUN chmod +x *.py
ENV PATH="/usr/local/krakentools:${PATH}"
WORKDIR /

# Clean 
RUN rm -rf /tmp/* \
  && rm -rf /var/lib/apt/lists/*
