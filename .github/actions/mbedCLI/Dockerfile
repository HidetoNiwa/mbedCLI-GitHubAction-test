FROM ubuntu:latest

RUN  apt-get update \
  && apt-get install -y tzdata \
  && apt-get install -y --no-install-recommends \
    curl \
    build-essential \
    clang \
    libboost-all-dev \
    python3 \
    python3-pip \
  && apt-get -y install libc6:i386 libncurses5:i386 libstdc++6:i386 wget \
  && wget -O gcc_arm_embedded.tar.bz2 "https://developer.arm.com/-/media/Files/downloads/gnu-rm/5_3-2016q1/gccarmnoneeabi532016q120160330linuxtar.bz2?revision=417e2623-c259-4a12-aacc-c87200b569c7?product=GNU%20Arm%20Embedded%20Toolchain,32-bit,,Linux,5-2016-q1-update" \
  && tar -jxf gcc_arm_embedded.tar.bz2 \
  && echo 'export PATH="/gcc-arm-none-eabi-5_3-2016q1/bin:$PATH"' >> $BASH_ENV \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /app
WORKDIR /app

ADD entrypoint.sh /entrypoint.sh
RUN ["chmod", "+x", "/entrypoint.sh"]
ENTRYPOINT ["/entrypoint.sh"]