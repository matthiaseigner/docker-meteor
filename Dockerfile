FROM          debian:jessie
MAINTAINER    Matthias Eigner (https://github.com/matthiaseigner) [me@matthiaseigner.at]

RUN apt-get update &&\
    apt-get install npm curl -y &&\
    curl https://install.meteor.com | /bin/sh

RUN useradd -m -G users -s /bin/bash meteor

USER meteor

RUN cd /tmp && meteor --version