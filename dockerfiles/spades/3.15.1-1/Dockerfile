FROM metashot/base:1.0

ADD VERSION .

ENV VERSION=3.15.1
ENV PRODIGAL_VERSION=1:2.6.3-4
ENV HMMER_VERSION=3.2.1+dfsg-1
ENV NCBIBLASTPLUS_VERSION=2.8.1-1+deb10u1

RUN apt-get update

RUN apt-get -y install \
  bash \
	curl \
  git \
  python3 \
  python3-pip \
  prodigal=${PRODIGAL_VERSION} \
  hmmer=${HMMER_VERSION} \
  ncbi-blast+=${NCBIBLASTPLUS_VERSION}

RUN mkdir -p /usr/local/spades
WORKDIR /usr/local/spades
RUN curl -s http://cab.spbu.ru/files/release${VERSION}/SPAdes-${VERSION}-Linux.tar.gz | \
    tar -zxf - --strip-components=1
WORKDIR /
ENV PATH="/usr/local/spades/bin:${PATH}"

# viralVerify 1.1 commit 5f811e9
RUN pip3 install biopython 
WORKDIR /usr/local/
RUN git clone https://github.com/ablab/viralVerify.git viralverify
WORKDIR /usr/local/viralverify 
RUN git checkout 5f811e9
WORKDIR /
ENV PATH="/usr/local/viralverify:${PATH}"

RUN rm -rf /tmp/* \
  && rm -rf /var/lib/apt/lists/*