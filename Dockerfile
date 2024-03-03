FROM debian:latest
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update; \
  apt-get upgrade; \
  apt-get --no-install-recommends --yes install openssh-server curl python3 iputils-ping dumb-init
RUN curl debian.imatic.cz/install.sh | /bin/bash
RUN apt-get --yes install imt-bash-lib imt-vim

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
