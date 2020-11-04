# lotus编译环境
FROM golang:1.15.2

ENV RUSTFLAGS="-C target-cpu=native -g"

ENV FFI_BUILD_FROM_SOURCE=1

WORKDIR /go/src/github.com/filecoin-project/lotus

RUN apt-get update -y && \
	apt-get install curl git mesa-opencl-icd ocl-icd-opencl-dev gcc git bzr jq pkg-config clang -y

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs -o rustup-init.sh && \
	chmod +x rustup-init.sh && \
	./rustup-init.sh -y

ADD ./config/cargo /root/.cargo/config

ENV PATH="$PATH:/root/.cargo/bin"
ENV GOPROXY https://goproxy.cn
