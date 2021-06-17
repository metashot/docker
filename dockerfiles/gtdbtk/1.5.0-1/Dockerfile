FROM metashot/base:1.0

ADD VERSION .

ENV PRODIGAL_VERSION=1:2.6.3-4
ENV HMMER_VERSION=3.2.1+dfsg-1
ENV PPLACER_VERSION=1.1.alpha19
ENV FASTANI_VERSION=1.32
ENV FASTTREE_VERSION=2.1.10-2
ENV MASH_VERSION=2.2

ENV VERSION=1.5.0

RUN apt-get update

RUN apt-get -y install \
  curl \
  unzip \
  python3 \
  python3-pip \
  build-essential \
  git \
  prodigal=${PRODIGAL_VERSION} \
  hmmer=${HMMER_VERSION} \
  fasttree=${FASTTREE_VERSION}

# install pplacer
RUN mkdir -p /usr/local/pplacer
WORKDIR /usr/local/pplacer
RUN curl -s -L https://github.com/matsen/pplacer/releases/download/v${PPLACER_VERSION}/pplacer-linux-v${PPLACER_VERSION}.zip -o pplacer.zip; \
    unzip -j pplacer.zip; \
    rm -rf pplacer.zip
WORKDIR /
ENV PATH="/usr/local/pplacer:${PATH}"

# install fastani
RUN mkdir -p /usr/local/fastani
WORKDIR /usr/local/fastani
RUN curl -s -L https://github.com/ParBLiSS/FastANI/releases/download/v${FASTANI_VERSION}/fastANI-Linux64-v${FASTANI_VERSION}.zip -o fastani.zip; \
    unzip -j fastani.zip; \
    rm -rf fastani.zip
WORKDIR /
ENV PATH="/usr/local/fastani:${PATH}"

# install mash
RUN mkdir -p /usr/local/mash
WORKDIR /usr/local/mash
RUN curl -s -L https://github.com/marbl/Mash/releases/download/v${MASH_VERSION}/mash-Linux64-v${MASH_VERSION}.tar | \
    tar -xf - --strip-components=1
WORKDIR /
ENV PATH="/usr/local/mash:${PATH}"

RUN pip3 install "numpy>= 1.9.0" "dendropy>= 4.1.0" "tqdm>= 4.31.0" "gtdbtk== ${VERSION}"

WORKDIR /

RUN rm -rf /tmp/* \
  && rm -rf /var/lib/apt/lists/*
