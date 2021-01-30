FROM ubuntu:latest

RUN  apt-get update \
  && apt-get install software-properties-common -y --no-install-recommends \
  && add-apt-repository ppa:team-gcc-arm-embedded/ppa \
  && apt-get update \
  && apt-get install -y --no-install-recommends \
    curl \
    python3 \
    python3-pip \
    gcc-arm-embedded \
    
  && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /app
WORKDIR /app

ADD entrypoint.sh /entrypoint.sh
RUN ["chmod", "+x", "/entrypoint.sh"]
ENTRYPOINT ["/entrypoint.sh"]