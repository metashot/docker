FROM metashot/base:1.0

ADD VERSION .

ENV VERSION=6.1.1

RUN apt-get update

RUN apt-get -y install \
  wget \
  curl \
  tar \
  python3 \
  python3-pip \
  hmmer2 \
  hmmer \
  diamond-aligner \
  fasttree \
  prodigal \
  ncbi-blast+ \
  muscle \
  default-jdk

# For meme only
RUN apt-get -y install \
  build-essential \
  autoconf \
  automake \
  perl \
  libexpat1-dev \
  zlib1g-dev \
  libxml2-dev \
  libxslt1-dev \
  ghostscript \
  libtool \
  ant \
  wget \
  cpanminus
RUN cpanm --force \
  Math::CDF \
  HTML::Template \
  XML::Simple \
  XML::Parser::Expat \
  XML::Compile::SOAP11 \
  XML::Compile::WSDL11 \
  XML::Compile::Transport::SOAPHTTP

# GlimmerHMM
WORKDIR /usr/local/glimmerhmm
RUN curl -s -L http://ccb.jhu.edu/software/glimmerhmm/dl/GlimmerHMM-3.0.4.tar.gz | \
    tar -zxf - --strip-components=1
WORKDIR /usr/local/glimmerhmm/bin
RUN ln -s glimmerhmm_linux_x86_64 glimmerhmm
WORKDIR /
ENV PATH="/usr/local/glimmerhmm/bin:${PATH}"

# MEME 4.11.2
WORKDIR /usr/local/meme
RUN wget -q -nd https://meme-suite.org/meme/meme-software/4.11.2/meme_4.11.2_2.tar.gz
RUN tar -zxf meme_4.11.2_2.tar.gz
WORKDIR /usr/local/meme/meme_4.11.2
RUN ./configure --prefix=/usr/local/
RUN make && make test && make install
WORKDIR /

# antiSMASH
RUN apt-get -y install \
  gfortran \
  libopenblas-dev \
  liblapack-dev
RUN pip3 install --upgrade pip
RUN wget -q -nd --no-check-certificate https://dl.secondarymetabolites.org/releases/6.1.1/antismash-6.1.1.tar.gz
RUN tar -zxf antismash-6.1.1.tar.gz
RUN pip3 install ./antismash-6.1.1
RUN download-antismash-databases
RUN antismash --check-prereqs

RUN rm -rf /tmp/* \
  && rm -rf /var/lib/apt/lists/*
