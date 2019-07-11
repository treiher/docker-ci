FROM debian:buster

RUN apt update && apt upgrade -y && apt install -y --no-install-recommends \
        ca-certificates \
        wget \
	git \
	build-essential \
	libfontconfig1 \
	libdbus-1-3 \
	libx11-xcb1 \
        libx11-6 \
	gawk \
	python \
	python2 \
	bison \
	flex \
	unzip \
	python-future \
	python-tempita \
	python-ply \
	python-six \
	autoconf \
	xsltproc \
	autogen \
	autoconf2.64 \
        expect \
        tcl \
        libxml2-utils \
        binutils-dev \
        zlib1g-dev \
        tidy \
        libelf-dev \
        bc \
        acpica-tools \
        && rm -rf /var/lib/apt/lists/*

ENV PATH=/usr/local/gnat/bin:$PATH
RUN wget -nv http://mirrors.cdn.adacore.com/art/5cdffc5409dcd015aaf82626 -O /tmp/gnat-community-2019-20190517-x86_64-linux-bin \
        && git clone https://github.com/jklmnn/gnat_community_install_script.git /tmp/gnat_community_install_script \
        && /tmp/gnat_community_install_script/install_package.sh /tmp/gnat-community-2019-20190517-x86_64-linux-bin /usr/local/gnat \
        && gprinstall --uninstall aws \
        && gprinstall --uninstall zfp_native_x86_64 \
        && rm /tmp/gnat-community-2019-20190517-x86_64-linux-bin \
        && rm -rf /tmp/gnat_community_install_script

RUN wget -nv https://downloads.sourceforge.net/project/genode/genode-toolchain/19.05/genode-toolchain-19.05-x86_64.tar.xz -O /tmp/genode-toolchain-19.05-x86_64.tar.xz \
        && tar xPf /tmp/genode-toolchain-19.05-x86_64.tar.xz \
        && rm /tmp/genode-toolchain-19.05-x86_64.tar.xz

RUN git clone https://github.com/genodelabs/genode.git /genode \
        && cd /genode \
        && git remote add componolit https://github.com/Componolit/genode.git && git fetch --all \
        && mkdir /contrib && ln -s /contrib /genode/contrib
RUN find /genode/repos -name "*.port" | sed "s/.*\///g;s/\.port//g" | grep -v "qt5.*" | grep -v "fatfs" | xargs /genode/tool/ports/prepare_port

RUN git clone https://git.codelabs.ch/git/muen.git /muen \
        && cd /muen \
        && git config --file=.gitmodules submodule.components/linux/src.url https://github.com/codelabs-ch/linux.git \
        && git submodule update --init components/linux/src \
        && git submodule update --init components/libxhcidbg \
        && git submodule update --init tools/mugenschedcfg \
        && git remote add componolit https://github.com/Componolit/muen.git \
        && git fetch --all
WORKDIR /
