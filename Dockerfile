FROM          debian:jessie
MAINTAINER    Matthias Eigner (https://github.com/matthiaseigner) [me@matthiaseigner.at]

RUN apt-get update &&\
    apt-get install git-all sudo npm curl -y &&\
    curl https://install.meteor.com | /bin/sh

RUN sudo sh -c "echo -e 'LANG=en_US.UTF-8\nLC_ALL=en_US.UTF-8' > /etc/default/locale"

RUN useradd -m -G users -s /bin/bash meteor

USER meteor

RUN cd /tmp && meteor --version