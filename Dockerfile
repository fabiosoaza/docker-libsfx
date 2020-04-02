FROM debian:stretch

RUN apt update -y
RUN apt install git make gcc g++ python -y

ENV LIBSFX_PATH /opt/libSFX

#libsfx
RUN git clone https://github.com/Optiroc/libSFX $LIBSFX_PATH
RUN cd $LIBSFX_PATH && make

RUN ln -s LIBSFX_PATH /usr/local/lib/libSFX
CMD sleep 600 