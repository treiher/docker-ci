FROM jklmnn/componolit-ci:latest-gnat

RUN apt update && apt upgrade -y && apt install -y --no-install-recommends \
	gawk \
	autoconf \
	xsltproc \
	autogen \
	autoconf2.64 \
        libxml2-utils \
        binutils-dev \
        zlib1g-dev \
        tidy \
        libelf-dev \
        bc \
        acpica-tools \
        && git clone https://git.codelabs.ch/git/muen.git /muen \
        && cd /muen \
        && git config --file=.gitmodules submodule.components/linux/src.url https://github.com/codelabs-ch/linux.git \
        && git submodule update --init components/linux/src \
        && git submodule update --init components/libxhcidbg \
        && git submodule update --init tools/mugenschedcfg \
        && git remote add componolit https://github.com/Componolit/muen.git \
        && git fetch --all \
        && rm -rf /var/lib/apt/lists/*
WORKDIR /
