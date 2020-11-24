FROM metashot/base:1.0

ADD VERSION .

ENV VERSION=1.14.5

RUN apt-get update
RUN apt-get install -y \
  build-essential \
  libdatetime-perl \
  libxml-simple-perl \
  libdigest-md5-perl \
  curl \
  default-jre \
  bioperl \
  cpanminus

# tbl2asn
RUN curl -s -L https://ftp.ncbi.nih.gov/toolbox/ncbi_tools/converters/by_program/tbl2asn/linux64.tbl2asn.gz -o linux64.tbl2asn.gz \
  && gunzip linux64.tbl2asn.gz \
  && mv linux64.tbl2asn /usr/local/bin/tbl2asn \
  && chmod +x /usr/local/bin/tbl2asn

RUN cpanm --force Bio::Perl

RUN mkdir -p /usr/local/prokka
WORKDIR /usr/local/prokka
RUN curl -s -L https://github.com/tseemann/prokka/archive/v${VERSION}.tar.gz | \
    tar -zxf - --strip-components=1
WORKDIR /
ENV PATH="/usr/local/prokka/bin/:$PATH"
RUN prokka --setupdb

RUN rm -rf /tmp/* \
  && rm -rf /var/lib/apt/lists/*
