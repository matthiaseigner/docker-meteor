FROM          roray/jessie-init-for-meteor
MAINTAINER    Matthias Eigner (https://github.com/matthiaseigner) [me@matthiaseigner.at]

RUN sudo apt-get update && \
    curl https://install.meteor.com | /bin/sh
