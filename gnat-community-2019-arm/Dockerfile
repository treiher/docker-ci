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
    && wget -nv https://community.download.adacore.com/v1/6696259f92b40178ab1cc1d3e005acf705dc4162?filename=gnat-community-2019-20190517-arm-elf-linux64-bin -O /tmp/gnat-community-2019-arm-elf-linux-bin \
    && git clone https://github.com/AdaCore/gnat_community_install_script /tmp/gnat_community_install_script \
    && /tmp/gnat_community_install_script/install_package.sh /tmp/gnat-community-2019-arm-elf-linux-bin /opt/gnat com.adacore.gnat \
    && rm /tmp/gnat-community-2019-arm-elf-linux-bin \
    && rm -rf /tmp/gnat_community_install_script \
    && rm -rf /var/lib/apt/lists/*
