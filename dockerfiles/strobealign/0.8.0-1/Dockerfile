FROM metashot/base:2.0

ADD VERSION .

ENV VERSION=0.8.0

RUN apt-get update

RUN apt-get -y install \
  curl \
  build-essential \
  cmake \
  git \
  zlib1g-dev

WORKDIR /usr/local/
RUN git clone https://github.com/ksahlin/strobealign
WORKDIR /usr/local/strobealign
RUN git checkout tags/v${VERSION}
RUN cmake -B build -DCMAKE_C_FLAGS="-march=native" -DCMAKE_CXX_FLAGS="-msse4.2"
RUN make -j -C build
ENV PATH="/usr/local/strobealign/build/:${PATH}" 
WORKDIR /

# Clean 
RUN rm -rf /tmp/* \
  && rm -rf /var/lib/apt/lists/*
