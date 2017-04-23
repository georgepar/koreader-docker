FROM koreader:dependencies

SHELL ["/bin/bash", "-c"]

ARG DEVICE=kobo
ENV DEVICE ${DEVICE}

RUN TOOLCHAIN=$(([[ "$DEVICE" == "kobo" ]] && echo "gcc-arm-linux-gnueabihf g++-arm-linux-gnueabihf") || \
              ([[ "$DEVICE" == "kindle" ]] && echo "gcc-arm-linux-gnueabi g++-arm-linux-gnueabi") || \
              ([[ "$DEVICE" == "win32" ]] && echo "gcc-mingw-w64-i686 g++-mingw-w64-i686") || \
              echo ""); echo $TOOLCHAIN > /toolchain

RUN TOOLCHAIN=`cat /toolchain`; echo "TOOLCHAIN = $TOOLCHAIN"

RUN TOOLCHAIN=`cat /toolchain`; [[ -z $TOOLCHAIN ]] && echo "No toolchain to install" || apt-get install -y $TOOLCHAIN

WORKDIR /koreader
#RUN ./kodev release ${DEVICE}

ENTRYPOINT ["/bin/bash"]
