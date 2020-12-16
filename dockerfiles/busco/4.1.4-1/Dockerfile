FROM metashot/base:1.0

ADD VERSION .

ENV PRODIGAL_VERSION=1:2.6.3-4
ENV HMMER_VERSION=3.2.1+dfsg-1
ENV PPLACER_VERSION=1.1.alpha19
ENV NCBIBLASTPLUS_VERSION=2.8.1-1+deb10u1
ENV AUGUSTUS_VERSION=3.3.2+dfsg-2
ENV SEPP_VERSION=4.3.10
ENV METAEUK_VERSION=3-8dc7e0b

ENV VERSION=4.1.4

RUN apt-get update

RUN apt-get -y install \
  curl \
  unzip \
  python3 \
  python3-pip \
  default-jre \
  build-essential \
  prodigal=${PRODIGAL_VERSION} \
  hmmer=${HMMER_VERSION} \
  ncbi-blast+=${NCBIBLASTPLUS_VERSION} \
  augustus=${AUGUSTUS_VERSION}

ENV PATH="/usr/share/augustus/scripts/:${PATH}"
ENV AUGUSTUS_CONFIG_PATH="/usr/share/augustus/config/"

# install pplacer
WORKDIR /usr/local/pplacer
RUN curl -s -L https://github.com/matsen/pplacer/releases/download/v${PPLACER_VERSION}/pplacer-linux-v${PPLACER_VERSION}.zip -o pplacer.zip; \
    unzip -j pplacer.zip; \
    rm -rf pplacer.zip
WORKDIR /
ENV PATH="/usr/local/pplacer:${PATH}"

# install sepp
RUN pip3 install "dendropy>= 4.0.0" 
WORKDIR /tmp/sepp
RUN curl -s -L https://github.com/smirarab/sepp/archive/${SEPP_VERSION}.tar.gz | \
    tar -zxf - --strip-components=1
RUN python3 setup.py config
RUN python3 setup.py install
WORKDIR /

# install metaeuk
WORKDIR /tmp/metaeuk
RUN curl -s -L https://github.com/soedinglab/metaeuk/releases/download/${METAEUK_VERSION}/metaeuk-linux-sse41.tar.gz | \
    tar -zxf - --strip-components=1
RUN mv bin/metaeuk /usr/local/bin
WORKDIR /

# install busco
RUN pip3 install biopython 
WORKDIR /tmp/busco
RUN curl -s -L https://gitlab.com/ezlab/busco/-/archive/${VERSION}/busco-${VERSION}.tar.gz | \
    tar -zxf - --strip-components=1
RUN python3 setup.py install
RUN mkdir /config
RUN ./scripts/busco_configurator.py config/config.ini /config/busco_config.ini
ENV BUSCO_CONFIG_FILE="/config/busco_config.ini"
WORKDIR /

RUN rm -rf /tmp/* \
  && rm -rf /var/lib/apt/lists/*
