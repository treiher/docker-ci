FROM debian:buster

ENV PATH=/usr/local/gnat/bin:$PATH
RUN apt update && apt upgrade -y && apt install -y --no-install-recommends \
        ca-certificates \
        wget \
	git \
	build-essential \
	libfontconfig1 \
	libdbus-1-3 \
	libx11-xcb1 \
        libx11-6 \
        && wget -nv http://mirrors.cdn.adacore.com/art/5cdffc5409dcd015aaf82626 -O /tmp/gnat-community-2019-20190517-x86_64-linux-bin \
        && git clone https://github.com/jklmnn/gnat_community_install_script.git /tmp/gnat_community_install_script \
        && /tmp/gnat_community_install_script/install_package.sh /tmp/gnat-community-2019-20190517-x86_64-linux-bin /usr/local/gnat \
        && gprinstall --uninstall aws \
        && gprinstall --uninstall zfp_native_x86_64 \
        && rm /tmp/gnat-community-2019-20190517-x86_64-linux-bin \
        && rm -rf /tmp/gnat_community_install_script \
        && rm -rf /var/lib/apt/lists/*

WORKDIR /
