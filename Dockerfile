FROM ubuntu:20.04

LABEL maintainer="Baris Tuncer <tuncerb@gmail.com>"

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update &&\
    apt-get install -y --no-install-recommends \
        build-essential \
        autoconf \
        automake \
        libtool \
        pkg-config \
        apt-transport-https \
        ca-certificates \
        software-properties-common \
        wget \
        git \
        libasan5\
         &&\
    apt-get clean

RUN wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | gpg --dearmor - | tee /etc/apt/trusted.gpg.d/kitware.gpg >/dev/null && \
    apt-add-repository 'deb https://apt.kitware.com/ubuntu/ focal main' && \
    apt-get update &&\
    apt-get install -y cmake

COPY . /usr/src/project

RUN cd /usr/src/project     \
    mkdir build             \
    cd build                \
    cmake ..                \ 
    make                    
    