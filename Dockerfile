FROM          debian:jessie
MAINTAINER    Matthias Eigner (https://github.com/matthiaseigner) [me@matthiaseigner.at]

RUN apt-get update &&\
    apt-get install git-all sudo npm curl locales -qq &&\
    curl https://install.meteor.com | /bin/sh

# add locale
RUN locale-gen en_US.UTF-8 en_us && dpkg-reconfigure locales && dpkg-reconfigure locales && locale-gen C.UTF-8 && /usr/sbin/update-locale LANG=C.UTF-8
ENV LANG C.UTF-8
ENV LANGUAGE C.UTF-8
ENV LC_ALL C.UTF-8

# add meteor user to nopasswd sudo
RUN echo "meteor ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/meteor-sudo

RUN useradd -m -G users -s /bin/bash meteor

USER meteor

RUN cd /tmp && meteor --version