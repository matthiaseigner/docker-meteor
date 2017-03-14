FROM          base/archlinux
MAINTAINER    Matthias Eigner (https://github.com/matthiaseigner) [me@matthiaseigner.at]

RUN sudo apt-get update &&\
    apt-get install npm -y &&\
    curl https://install.meteor.com | /bin/sh

RUN useradd -m -G users -s /bin/bash meteor

USER meteor

RUN cd /tmp && meteor --version