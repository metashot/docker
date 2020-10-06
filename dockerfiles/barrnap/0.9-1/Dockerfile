FROM metashot/base:1.0

ADD VERSION .

ENV VERSION=0.9
ENV HMMER_VERSION=3.2.1+dfsg-1
ENV BEDTOOLS_VERSION=2.27.1+dfsg-4

RUN apt-get update

RUN apt-get -y install \
  curl \
  perl \
  hmmer=${HMMER_VERSION} \
  bedtools=${BEDTOOLS_VERSION}

RUN mkdir /usr/local/barrnap
WORKDIR /usr/local/barrnap
RUN curl -s -L https://github.com/tseemann/barrnap/archive/${VERSION}.tar.gz | \
    tar -zxf - --strip-components=1
ENV PATH="/usr/local/barrnap/bin:${PATH}"
WORKDIR /

# Clean 
RUN rm -rf /tmp/* \
  && rm -rf /var/lib/apt/lists/*
