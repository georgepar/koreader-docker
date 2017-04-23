FROM ubuntu:16.04

SHELL ["/bin/bash", "-c"]

RUN dpkg --add-architecture i386
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" >> /etc/apt/sources.list

RUN apt-get update
RUN apt-get install -y build-essential git patch wget unzip gettext \
                       autoconf automake cmake libtool nasm luarocks \
                       libssl-dev libffi-dev libsdl2-dev libc6-dev-i386 \
                       xutils-dev linux-libc-dev:i386 zlib1g:i386 \
                       ant openjdk-8-jdk click libsdl2-dev libicu-dev \
                       libpango1.0-dev libcairo2-dev libacl1-dev


WORKDIR /
RUN git clone https://github.com/koreader/koreader.git

ARG KOREADER_TAG=v2017.03.08-nightly
ENV KOREADER_TAG ${KOREADER_TAG}

WORKDIR /koreader
RUN git checkout ${KOREADER_TAG}
RUN make fetchthirdparty


ENTRYPOINT ["/bin/bash"]
