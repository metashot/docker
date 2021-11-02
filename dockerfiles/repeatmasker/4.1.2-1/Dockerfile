FROM metashot/base:2.0

ADD VERSION .

ENV RMBLAST_VERSION=2.11.0
ENV TRF_VERSION=409
ENV RECON_VERSION=1.08
ENV REPEATSCOUT_VERSION=1.0.6
ENV REPEATMODELER_VERSION=2.0.2a

ENV VERSION=4.1.2-p1

RUN apt-get update

RUN apt-get -y install \
  curl \
  wget \
  unzip \
  python3 \
  python3-h5py \
  build-essential \
  libjson-perl \
  libfile-which-perl \
  liburi-perl \
  liblwp-useragent-determined-perl \
  libdevel-size-perl \
  cd-hit


# install RMBlast
WORKDIR /usr/local/rmblast
RUN curl -s -L http://www.repeatmasker.org/rmblast-${RMBLAST_VERSION}+-x64-linux.tar.gz | \
    tar -zxf - --strip-components=1
WORKDIR /
ENV PATH="/usr/local/rmblast/bin:${PATH}"

# install TRF
WORKDIR /usr/local/trf
RUN curl -s -L http://tandem.bu.edu/trf/downloads/trf${TRF_VERSION}.linux64 --output trf \
     && chmod +x trf
WORKDIR /
ENV PATH="/usr/local/trf:${PATH}"

# install RECON
WORKDIR /usr/local/recon
RUN curl -s -L http://www.repeatmasker.org/RepeatModeler/RECON-${RECON_VERSION}.tar.gz | \
    tar -zxf - --strip-components=1
WORKDIR /usr/local/recon/src 
RUN make && make install
WORKDIR /
ENV PATH="/usr/local/recon/bin:${PATH}"

# install UCSC TwoBit Tools
WORKDIR /usr/local/twobit
RUN wget -q -nd http://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64.v385/bptForTwoBit \
  && wget -q -nd http://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64.v385/faToTwoBit \
  && wget -q -nd http://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64.v385/twoBitDup \
  && wget -q -nd http://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64.v385/twoBitInfo \
  && wget -q -nd http://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64.v385/twoBitMask \
  && wget -q -nd http://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64.v385/twoBitToFa
RUN chmod +x *
WORKDIR /
ENV PATH="/usr/local/twobit:${PATH}"

# install RepeatScout
WORKDIR /usr/local/nseg
RUN wget -q ftp://ftp.ncbi.nih.gov/pub/seg/nseg/* \
  && make
WORKDIR /
ENV PATH="/usr/local/nseg:${PATH}"

WORKDIR /usr/local/repeatscout
RUN curl -s -L http://www.repeatmasker.org/RepeatScout-${REPEATSCOUT_VERSION}.tar.gz | \
    tar -zxf - --strip-components=1
RUN make
WORKDIR /
ENV PATH="/usr/local/repeatscout:${PATH}"

# install RepeatMasker
WORKDIR /usr/local/repeatmasker
RUN curl -s -L https://www.repeatmasker.org/RepeatMasker/RepeatMasker-${VERSION}.tar.gz | \
    tar -zxf - --strip-components=1
RUN perl ./configure \
    -rmblast_dir "/usr/local/rmblast/bin" \
    -trf_prgm "/usr/local/trf/trf" \
    -default_search_engine "rmblast"
WORKDIR /
ENV PATH="/usr/local/repeatmasker:${PATH}"

# install RepeatModeler
WORKDIR /usr/local/repeatmodeler
RUN curl -s -L https://www.repeatmasker.org/RepeatModeler/RepeatModeler-${REPEATMODELER_VERSION}.tar.gz | \
    tar -zxf - --strip-components=1
RUN printf "\n\nn\n" | perl ./configure \
    -recon_dir "/usr/local/recon/bin" \
    -rmblast_dir "/usr/local/rmblast/bin" \
    -trf_prgm "/usr/local/trf/trf" \
    -rscout_dir "/usr/local/repeatscout" \
    -repeatmasker_dir "/usr/local/repeatmasker" \
    -cdhit_dir "/usr/bin/" \
    -ucsctools_dir "/usr/local/twobit"
WORKDIR /
ENV PATH="/usr/local/repeatmodeler:${PATH}"

RUN rm -rf /tmp/* \
  && rm -rf /var/lib/apt/lists/*
