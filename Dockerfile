FROM ubuntu:22.04

LABEL maintainer="therealoof"

ENV DEBIAN_FRONTEND noninteractive

## add container user
RUN useradd -m -d /home/container container
ENV USER=container HOME=/home/container

RUN apt update && apt upgrade -y

RUN apt install -y gcc g++ wget curl tar zip unzip

## configure locale
RUN update-locale lang=en_US.UTF-8 \
 && dpkg-reconfigure --frontend noninteractive locales
 
## Test stuff
# RUN ln -sf /.local/share/Terraria /home/container

WORKDIR /home/container
COPY ./entrypoint.sh /entrypoint.sh
CMD ["/bin/bash", "/entrypoint.sh"]
