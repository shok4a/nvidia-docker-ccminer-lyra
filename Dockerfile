FROM nvidia/cuda:7.5
RUN ln -s /usr/local/cuda-7.5/targets/x86_64-linux/lib/libcudart.so /usr/lib/libcudart.so
RUN apt-get update && \
  apt-get upgrade -yqq && \
  apt-get install -yqq git libcurl4-nss-dev libjansson-dev libssl-dev build-essential automake libssl-dev libcurl4-nss-dev && \
  git clone https://github.com/djm34/ccminer-lyra.git && \
  cd /ccminer-lyra && \
  bash autogen.sh && \
  ./configure && \
  make install && \
  cd / && \
  rm -rf /ccminer-lyra && \
  rm -rf /var/lib/apt/lists/*

