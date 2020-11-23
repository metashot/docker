FROM metashot/base:1.0

ADD VERSION .

ENV VERSION=3.12.0+dfsg-2

RUN apt-get update
RUN apt-get install -y \
  curl \
  python3-pip \
  roary=${VERSION}

RUN pip3 install biopython numpy pandas matplotlib seaborn
RUN curl https://raw.githubusercontent.com/sanger-pathogens/Roary/master/contrib/roary_plots/roary_plots.py \
    --output /usr/local/bin/roary_plots.py \
  && chmod +x /usr/local/bin/roary_plots.py

RUN rm -rf /tmp/* \
  && rm -rf /var/lib/apt/lists/*
