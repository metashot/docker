FROM metashot/base:2.0

ADD VERSION .

ENV VERSION=5.1

RUN apt-get update
RUN apt-get install -y \
    curl 

WORKDIR /usr/local/muscle
RUN curl -s -L -o muscle https://github.com/rcedgar/muscle/releases/download/v${VERSION}/muscle${VERSION}.linux_intel64 \
  && chmod +x muscle

WORKDIR /

ENV PATH="/usr/local/muscle:${PATH}"

RUN rm -rf /tmp/* \
  && rm -rf /var/lib/apt/lists/*
