FROM metashot/base:1.0

ADD VERSION .

ENV VERSION=2.1.4

RUN apt-get update

RUN apt-get -y install \
  wget \
  curl \
  tar \
  python3 \
  python3-pip

RUN pip3 install \
  "biopython== 1.76" \
  "psutil== 5.7.0" \
  "xlsxwriter== 1.4.3"

COPY diamond .
RUN mv diamond /usr/local/bin

RUN pip3 install "eggnog-mapper== ${VERSION}"

RUN rm -rf /tmp/* \
  && rm -rf /var/lib/apt/lists/*
