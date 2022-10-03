FROM metashot/base:2.0

ADD VERSION .

ENV PRODIGAL_VERSION=1:2.6.3-4
ENV HMMER_VERSION=3.3.2+dfsg-1
ENV PPLACER_VERSION=1.1.alpha19
ENV NCBIBLASTPLUS_VERSION=2.11.0
ENV AUGUSTUS_VERSION=3.4.0+dfsg2-2
ENV SEPP_VERSION=4.3.10
ENV METAEUK_VERSION=3-8dc7e0b
ENV BBMAP_VERSION=38.79

ENV VERSION=5.1.3

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
  augustus=${AUGUSTUS_VERSION}

# install bbmap
RUN mkdir -p /usr/local/bbmap
WORKDIR /usr/local/bbmap
RUN curl -s -L https://sourceforge.net/projects/bbmap/files/BBMap_${BBMAP_VERSION}.tar.gz/download | \
    tar -zxf - --strip-components=1
WORKDIR /
ENV PATH="/usr/local/bbmap:${PATH}"

# install blast+
WORKDIR /usr/local/ncbi-blast+
RUN curl -s -L https://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/${NCBIBLASTPLUS_VERSION}/ncbi-blast-${NCBIBLASTPLUS_VERSION}+-x64-linux.tar.gz | \
    tar -zxf - --strip-components=1
WORKDIR /
ENV PATH="/usr/local/ncbi-blast+/bin:${PATH}"

# install pplacer
WORKDIR /usr/local/pplacer
RUN curl -s -L https://github.com/matsen/pplacer/releases/download/v${PPLACER_VERSION}/pplacer-linux-v${PPLACER_VERSION}.zip -o pplacer.zip; \
    unzip -j pplacer.zip; \
    rm -rf pplacer.zip
WORKDIR /
ENV PATH="/usr/local/pplacer:${PATH}"

# install sepp
RUN pip3 install "dendropy>= 4.0.0" 
WORKDIR /usr/local/sepp
RUN curl -s -L https://github.com/smirarab/sepp/archive/${SEPP_VERSION}.tar.gz | \
    tar -zxf - --strip-components=1
RUN python3 setup.py config -c
RUN python3 setup.py install
WORKDIR /

# install metaeuk
WORKDIR /tmp/metaeuk
RUN curl -s -L https://github.com/soedinglab/metaeuk/releases/download/${METAEUK_VERSION}/metaeuk-linux-sse41.tar.gz | \
    tar -zxf - --strip-components=1
RUN mv bin/metaeuk /usr/local/bin
WORKDIR /

# install busco
RUN pip3 install biopython pandas
WORKDIR /tmp/busco
RUN curl -s -L https://gitlab.com/ezlab/busco/-/archive/${VERSION}/busco-${VERSION}.tar.gz | \
    tar -zxf - --strip-components=1
RUN python3 setup.py install
WORKDIR /

# augustus config
RUN mkdir /config
ENV PATH="/usr/share/augustus/scripts/:${PATH}"
RUN cp -r /usr/share/augustus/config/ /config/augustus
RUN chmod 777 /config/augustus/species
ENV AUGUSTUS_CONFIG_PATH="/config/augustus"

RUN rm -rf /tmp/* \
  && rm -rf /var/lib/apt/lists/*
