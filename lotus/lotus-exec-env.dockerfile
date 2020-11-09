# lotus运行环境
FROM nvidia/opencl:runtime-ubuntu18.04
ENV DEBIAN_FRONTEND=noninteractive

COPY config/config.toml /root/config.toml
COPY scripts/entrypoint /bin/entrypoint
RUN chmod 777 /bin/entrypoint

RUN apt update && \
    apt upgrade -y && \
    apt install mesa-opencl-icd ocl-icd-opencl-dev libhwloc-dev -y

WORKDIR /lotus/bin

# API 端口
EXPOSE 1234/tcp

# P2P 端口
EXPOSE 1235/tcp

# ENTRYPOINT ["/bin/entrypoint"]
