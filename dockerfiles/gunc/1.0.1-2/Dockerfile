FROM metashot/base:1.0

ADD VERSION .

ENV PRODIGAL_VERSION=1:2.6.3-4
ENV DIAMOND_VERSION=2.0.4

ENV VERSION=1.0.1

RUN apt-get update

RUN apt-get -y install \
  curl \
  unzip \
  python3 \
  python3-pip \
  prodigal=${PRODIGAL_VERSION}

COPY diamond .
RUN mv diamond /usr/local/bin

RUN pip3 install "gunc== ${VERSION}"

RUN rm -rf /tmp/* \
  && rm -rf /var/lib/apt/lists/*