FROM debian:buster

ENV PATH=/opt/gnat/bin:$PATH

RUN apt-get update \
    && apt-get install -y \
        dbus \
        fontconfig \
        git \
        libc-dev \
        libx11-6 \
        libx11-xcb1 \
        make \
        wget \
    && apt-get clean \
    && wget -nv https://community.download.adacore.com/v1/4d99b7b2f212c8efdab2ba8ede474bb9fa15888d?filename=gnat-2020-20200429-x86_64-linux-bin -O /tmp/gnat-2020-20200429-x86_64-linux-bin \
    && git clone https://github.com/AdaCore/gnat_community_install_script /tmp/gnat_community_install_script \
    && /tmp/gnat_community_install_script/install_package.sh /tmp/gnat-2020-20200429-x86_64-linux-bin /opt/gnat com.adacore.spark2014_discovery,com.adacore.gnat \
    && gprinstall --uninstall aws \
    && rm -rf /tmp/gnat_community_install_script \
    && rm -rf /var/lib/apt/lists/*
