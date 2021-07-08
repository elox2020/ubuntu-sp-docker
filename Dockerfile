FROM ubuntu
ARG DEBIAN_FRONTEND=noninteractive
RUN apt update && \
    apt install -y openssh-server && \
    apt install -y python-is-python3

COPY sshd_config /etc/ssh/

RUN chmod 644 /etc/ssh/sshd_config && \
    unlink /etc/localtime && \
    ln -s /usr/share/zoneinfo/America/New_York /etc/localtime && \
    echo 'root:ubuntu' | chpasswd

ENTRYPOINT service ssh start && \
           /bin/bash
