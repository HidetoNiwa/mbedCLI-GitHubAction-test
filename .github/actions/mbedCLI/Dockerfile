FROM ubuntu:latest

RUN  apt-get update \
  && apt-get install -y --no-install-recommends \
    curl \
    build-essential \
    clang \
    libboost-all-dev \
    python3 \
    python3-pip \
    gcc-arm-none-eabi \
    
  && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /app
WORKDIR /app

ADD entrypoint.sh /entrypoint.sh
RUN ["chmod", "+x", "/entrypoint.sh"]
ENTRYPOINT ["/entrypoint.sh"]