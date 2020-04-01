FROM debian:buster

RUN apt update && apt upgrade -y && apt install -y --no-install-recommends \
        ca-certificates \
        wget \
	git \
        subversion \
	build-essential \
	gawk \
	python \
	python2 \
        python3 \
	bison \
	flex \
	unzip \
	python-future \
	python-tempita \
	python-ply \
	python-six \
        python3-pyparsing \
	autoconf \
	xsltproc \
	autogen \
	autoconf2.64 \
        expect \
        tcl \
        libxml2-utils \
        xorriso \
        qemu-system \
        ccache \
        ed \
        byacc \
        iasl \
        tidy \
        zlib1g-dev \
        && wget -nv https://downloads.sourceforge.net/project/genode/genode-toolchain/19.05/genode-toolchain-19.05-x86_64.tar.xz -O /tmp/genode-toolchain-19.05-x86_64.tar.xz \
        && tar xPf /tmp/genode-toolchain-19.05-x86_64.tar.xz \
        && rm /tmp/genode-toolchain-19.05-x86_64.tar.xz \
        && git clone https://github.com/genodelabs/genode.git /genode \
        && cd /genode \
        && git remote add componolit https://github.com/Componolit/genode.git && git fetch --all \
        && mkdir /contrib && ln -s /contrib /genode/contrib \
        && rm -rf /var/lib/apt/lists/*

WORKDIR /
