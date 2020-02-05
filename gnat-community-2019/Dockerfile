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
    && wget -nv https://community.download.adacore.com/v1/0cd3e2a668332613b522d9612ffa27ef3eb0815b?filename=gnat-community-2019-20190517-x86_64-linux-bin -O /tmp/gnat-community-2019-x86_64-linux-bin \
    && git clone https://github.com/AdaCore/gnat_community_install_script /tmp/gnat_community_install_script \
    && /tmp/gnat_community_install_script/install_package.sh /tmp/gnat-community-2019-x86_64-linux-bin /opt/gnat com.adacore.spark2014_discovery,com.adacore.gnat \
    && gprinstall --uninstall aws \
    && gprinstall --uninstall zfp_native_x86_64 \
    && rm /tmp/gnat-community-2019-x86_64-linux-bin \
    && rm -rf /tmp/gnat_community_install_script \
    && rm -rf /var/lib/apt/lists/*
