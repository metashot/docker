FROM metashot/base:2.0

ADD VERSION .

ENV VERSION=5-34c21f2

RUN apt-get update
RUN apt-get -y install \
  curl

WORKDIR /usr/local/metaeuk
RUN curl -s -L https://github.com/soedinglab/metaeuk/releases/download/${VERSION}/metaeuk-linux-sse41.tar.gz | \
  tar -zxf - --strip-components=1
WORKDIR /
ENV PATH="/usr/local/metaeuk/bin:${PATH}"

RUN rm -rf /tmp/* \
  && rm -rf /var/lib/apt/lists/*