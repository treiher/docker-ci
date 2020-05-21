FROM componolit/ci:gnat-community-2020

ENV PATH=/opt/gnat-arm/bin:$PATH

RUN wget -nv https://community.download.adacore.com/v1/2b8ddb644a06808e7d2c6b62edf16d31b02f514f?filename=gnat-2020-20200429-arm-elf-linux64-bin -O /tmp/gnat-2020-20200429-arm-elf-linux64-bin \
    && git clone https://github.com/AdaCore/gnat_community_install_script /tmp/gnat_community_install_script \
    && /tmp/gnat_community_install_script/install_package.sh /tmp/gnat-2020-20200429-arm-elf-linux64-bin /opt/gnat-arm com.adacore.gnat \
    && rm /tmp/gnat-2020-20200429-arm-elf-linux64-bin
