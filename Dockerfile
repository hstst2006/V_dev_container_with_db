FROM ubuntu:24.10

RUN apt update && apt install -y \
                            git \
                            build-essential \ 
                            make

WORKDIR /vbuild
RUN git clone https://github.com/vlang/v

WORKDIR /vbuild/v
RUN make
RUN ln -s /vbuild/v/v /usr/bin/v

WORKDIR /v
CMD [ "bash"]
