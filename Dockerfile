FROM ubuntu:22.04

LABEL maintainer="therealoof"

ENV DEBIAN_FRONTEND noninteractive

## add container user
RUN useradd -m -d /home/container container
ENV USER=container HOME=/home/container

RUN apt update && apt upgrade -y

RUN apt install -y wget curl tar zip unzip

WORKDIR /home/container
COPY ./entrypoint.sh /entrypoint.sh
CMD ["/bin/bash", "/entrypoint.sh"]
