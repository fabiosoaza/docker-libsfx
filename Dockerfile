FROM debian:stretch

RUN apt update -y
RUN apt install git make gcc g++ python -y

ENV LIBSFX_PATH /opt/libSFX
ENV PATH "$LIBSFX_PATH/tools/cc65/bin/:$PATH"

#libsfx
RUN git clone https://github.com/Optiroc/libSFX $LIBSFX_PATH
RUN cd $LIBSFX_PATH && make

RUN ln -s LIBSFX_PATH /usr/local/lib/libSFX

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
CMD sleep 600 
