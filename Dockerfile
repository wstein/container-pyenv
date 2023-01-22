# https://hub.docker.com/_/fedora
ARG BASEIMAGE=docker.io/fedora:latest
FROM ${BASEIMAGE}

RUN dnf -y install git curl wget make gcc zlib-devel bzip2 bzip2-devel \
           readline-devel sqlite sqlite-devel openssl-devel tk-devel \
           libffi-devel xz-devel libuuid-devel gdbm-devel libnsl2-devel

COPY bashrc-pyenv /tmp/
ENV PYENV_ROOT=/opt/pyenv
RUN curl -fsSL https://pyenv.run | bash &&\
    cat /tmp/bashrc-pyenv >>~/.bashrc
