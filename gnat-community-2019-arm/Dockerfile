FROM componolit/ci:gnat-community-2019

ENV PATH=/opt/gnat-arm/bin:$PATH

RUN wget -nv https://community.download.adacore.com/v1/6696259f92b40178ab1cc1d3e005acf705dc4162?filename=gnat-community-2019-20190517-arm-elf-linux64-bin -O /tmp/gnat-community-2019-arm-elf-linux-bin \
    && git clone https://github.com/AdaCore/gnat_community_install_script /tmp/gnat_community_install_script \
    && /tmp/gnat_community_install_script/install_package.sh /tmp/gnat-community-2019-arm-elf-linux-bin /opt/gnat-arm com.adacore.gnat \
    && rm /tmp/gnat-community-2019-arm-elf-linux-bin
