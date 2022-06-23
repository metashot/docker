FROM metashot/base:2.0

ADD VERSION .

RUN apt-get update

RUN apt-get -y install \
  curl \
  wget \
  bzip2 \
  gzip \
  python3 \
  python3-pip \
  build-essential

# for pysam
RUN apt-get -y install \
  libbz2-dev \
  zlib1g-dev \
  liblzma-dev 
RUN pip3 install Cython

# for PyTables
RUN apt-get -y install libhdf5-dev

RUN pip3 install \
  numpy \
  scipy \
  pandas \
  matplotlib \
  biopython \
  pysam \
  matplotlib \
  scikit-learn \
  scikit-allel \
  tables 
  
RUN pip3 install \
  amas

RUN rm -rf /tmp/* \
  && rm -rf /var/lib/apt/lists/*
