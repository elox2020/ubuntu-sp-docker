from ubuntu
ARG DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install -y openssh-server && apt install -y tzdata && apt install -y python

RUN unlink /etc/localtime
RUN ln -s /usr/share/zoneinfo/America/New_York /etc/localtime
RUN echo 'root:ubuntu' | chpassword

ENTRYPOINT service ssh start && /bin/bash
