ARG BUILD_FROM=hassioaddons/debian-base:4.2.2
# hadolint ignore=DL3006
FROM ${BUILD_FROM} AS base

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Set correct environment variables
ENV DEBIAN_FRONTEND="noninteractive"
ENV LC_ALL="C.UTF-8" 
ENV LANG="en_US.UTF-8" 
ENV LANGUAGE="en_US.UTF-8" 

# Upgrading the operating system inside the container
RUN apt-get update && apt-get upgrade -y -o Dpkg::Options::="--force-confold" && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

FROM base AS builder
ARG SL_COMMIT=556de5689d27b4440adbfeb3c3012da02dbf438e

# Install Squeezelite
RUN apt-get -qq -y update && \
    apt-get --no-install-recommends --no-install-suggests -qq -y install \
    alsa-utils \
    libasound2-plugins \
    libasound2-data \
    portaudio19-dev \
    libasound2-dev \
    libvorbis-dev \
    libmad0-dev \
    libmpg123-dev \
    libfaad-dev \
    libsox-dev \
    libsoxr-dev \
    libavformat-dev \
    liblirc-dev \
    libssl-dev \
    libopusfile-dev \
    libflac-dev \
    faad \
    git \
    build-essential
#RUN cd /tmp && git clone https://github.com/ralph-irving/squeezelite && cd squeezelite && make -f Makefile.pa OPTS="-DDSD"
#RUN cd /tmp && git clone https://github.com/ralph-irving/squeezelite && cd squeezelite && make -f Makefile OPTS="-DDSD"
RUN cd /tmp && git clone https://github.com/ralph-irving/squeezelite && cd squeezelite && git checkout ${SL_COMMIT} && make -f Makefile OPTS="-DDSD -DRESAMPLE -DVISEXPORT"
RUN if [ -x /tmp//tmp/squeezelite/squeezelite-pa ];then mv /tmp/squeezelite/squeezelite-pa /tmp/squeezelite/squeezelite;fi
#  -DOPUS -DALAC -DRESAMPLE -DVISEXPORT -DDSD -DIR -DGPIO -DRPI -DUSE_SSL -DLINKALL -I./include -I./include/opus -I./include/alac 

FROM base

ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_REF
ARG BUILD_VERSION

RUN apt-get -qq -y update && \
    apt-get --no-install-recommends --no-install-suggests -qq -y install \
    openssl \
    alsa-utils \
    libasound2-plugins \
    libasound2-data \
    libportaudio2 \
    libasound2 \
    libvorbis0a \
    libmad0 \
    libmpg123-0 \
    libfaad2 \
    libsox3 \
    libsoxr0 \
    libavformat58 \
    liblirc-client0 \
    libssl1.1 \
    libopusfile0 \
    libflac8 && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/run/*
COPY rootfs /
COPY --from=builder /tmp/squeezelite/squeezelite /usr/local/bin/squeezelite

# Labels
LABEL \
    io.hass.name="Squeezelite Player" \
    io.hass.description="Squeezelite HA Addon player" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="Phillip Camp <phillip.camp+ha@gmail.com>" \
    org.opencontainers.image.title="Squeezelite" \
    org.opencontainers.image.description="Squeezelite HA Addon player" \
    org.opencontainers.image.vendor="pssc" \
    org.opencontainers.image.authors="Phillip, Adrian & Ralph" \
    org.opencontainers.image.licenses="Multiple" \
    org.opencontainers.image.url="https://github.com/pssc/ha-addon-lms/" \
    org.opencontainers.image.source="https://github.com/pssc/ha-addon-squeezelite/squeezelite/" \
    org.opencontainers.image.documentation="https://github.com/pssc/ha-addon-squeezelite/blob/master/squeezelite/DOCS.md" \
    org.opencontainers.image.created=${BUILD_DATE} \
    org.opencontainers.image.revision=${BUILD_REF} \
    org.opencontainers.image.version=${BUILD_VERSION}

