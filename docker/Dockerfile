
ARG IMAGE
FROM ${IMAGE}
RUN apt update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        sudo \
        build-essential \
        ca-certificates \
        dos2unix \
        gcc-aarch64-linux-gnu \
        gcc-arm-linux-gnueabi \
        gcc-arm-linux-gnueabihf \
        libc6-dev-armel-cross \ 
        libc6-armel-cross \
        git \
        iasl \
        make \
        nasm \
        python \
        uuid-dev \
        wget\
        git \
        vim \
        zip \
        unzip \
        file\
    && \
    rm -rf /var/lib/apt/lists/*

ENV PATH="${PATH}:/usr/arm-linux-gnueabihf/bin"
ENV PATH="${PATH}:/usr/arm-linux-gnueabi/bin"