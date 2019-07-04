FROM debian:buster

RUN apt update
RUN apt upgrade -y
RUN apt install -y \
        wget \
	git \
	build-essential \
	libfontconfig1 \
	libdbus-1-3 \
	libx11-xcb1 \
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
	autoconf2.64

RUN wget -nv http://mirrors.cdn.adacore.com/art/5cdffc5409dcd015aaf82626 -O /tmp/gnat-community-2019-20190517-x86_64-linux-bin
RUN git clone https://github.com/AdaCore/gnat_community_install_script.git /tmp/gnat_community_install_script
RUN /tmp/gnat_community_install_script/install_package.sh /tmp/gnat-community-2019-20190517-x86_64-linux-bin /usr/local/gnat

RUN wget -nv https://downloads.sourceforge.net/project/genode/genode-toolchain/19.05/genode-toolchain-19.05-x86_64.tar.xz -O /tmp/genode-toolchain-19.05-x86_64.tar.xz
RUN tar xPf /tmp/genode-toolchain-19.05-x86_64.tar.xz

RUN mkdir /contrib
RUN git clone https://github.com/genodelabs/genode.git /genode
WORKDIR /genode
RUN git remote add componolit https://github.com/Componolit/genode.git
RUN git fetch --all
RUN ln -s /contrib /genode/contrib
RUN find /genode/repos -name "*.port" | sed "s/.*\///g;s/\.port//g" | grep -v "qt5.*" | xargs /genode/tool/ports/prepare_port
WORKDIR /

RUN git clone https://git.codelabs.ch/git/muen.git /muen
WORKDIR /muen
RUN git config --file=.gitmodules submodule.components/linux/src.url https://github.com/codelabs-ch/linux.git
RUN git submodule update --init components/linux/src
RUN git submodule update --init components/libxhcidbg
RUN git submodule update --init tools/mugenschedcfg
RUN git remote add componolit https://github.com/Componolit/muen.git
RUN git fetch --all
WORKDIR /

RUN rm -rf /tmp/*
RUN apt autoclean
RUN apt clean
