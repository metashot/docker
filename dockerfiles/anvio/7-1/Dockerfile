FROM metashot/base:1.0

ADD VERSION .

ENV VERSION=7

RUN apt-get update

RUN apt-get -y install \
  curl

# Install Miniconda3
RUN curl -O https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
RUN sh Miniconda3-latest-Linux-x86_64.sh -b -p /miniconda3
ENV PATH="/miniconda3/bin:${PATH}"
RUN rm Miniconda3-latest-Linux-x86_64.sh

COPY environment.yml .
RUN conda env create -f environment.yml

RUN curl -L https://github.com/merenlab/anvio/releases/download/v7/anvio-7.tar.gz \
  --output anvio-7.tar.gz
RUN conda run -n anvio pip install anvio-7.tar.gz
RUN rm anvio-7.tar.gz

ENV PATH="/miniconda3/envs/anvio/bin:${PATH}"

# Clean 
RUN rm -rf /tmp/* \
  && rm -rf /var/lib/apt/lists/* \
  && conda clean --all
