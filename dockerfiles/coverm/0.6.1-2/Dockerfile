FROM metashot/base:2.0

ADD VERSION .

ENV BWAMEM2_VERSION=2.2.1
ENV FASTANI_VERSION=1.32
ENV DASHING_VERSION=1.0

ENV VERSION=0.6.1

RUN apt-get update

RUN apt-get -y install \
  curl \
  zip \
  bzip2 \
  minimap2 \
  libgomp1

# install bwa-mem2
WORKDIR /usr/local/bwamem2
RUN curl -s -L https://github.com/bwa-mem2/bwa-mem2/releases/download/v${BWAMEM2_VERSION}/bwa-mem2-${BWAMEM2_VERSION}_x64-linux.tar.bz2 | \
    tar -jxf - --strip-components=1
WORKDIR /
ENV PATH="/usr/local/bwamem2:${PATH}"

# install fastani
WORKDIR /usr/local/fastani
RUN curl -s -L https://github.com/ParBLiSS/FastANI/releases/download/v${FASTANI_VERSION}/fastANI-Linux64-v${FASTANI_VERSION}.zip -o fastani.zip; \
    unzip -j fastani.zip; \
    rm -rf fastani.zip
WORKDIR /
ENV PATH="/usr/local/fastani:${PATH}"

# install dashing
WORKDIR /usr/local/dashing
RUN curl -s -L https://github.com/dnbaker/dashing/blob/v${DASHING_VERSION}/release/linux/dashing_s128.gz?raw=true | \
    gunzip > dashing; \
    chmod +x dashing
WORKDIR /
ENV PATH="/usr/local/dashing:${PATH}"

# install coverm
WORKDIR /usr/local/coverm
RUN curl -s -L https://github.com/wwood/CoverM/releases/download/v${VERSION}/coverm-x86_64-unknown-linux-musl-${VERSION}.tar.gz | \
    tar -zxf - --strip-components=1
WORKDIR /
ENV PATH="/usr/local/coverm:${PATH}"

RUN rm -rf /tmp/* \
  && rm -rf /var/lib/apt/lists/*