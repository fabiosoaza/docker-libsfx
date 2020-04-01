FROM debian:stretch

RUN apt update -y
RUN apt install git make gcc g++ -y

#libsfx
RUN git clone https://github.com/Optiroc/libSFX /tmp/libSFX
RUN cd /tmp/libSFX && make

CMD sleep 600 