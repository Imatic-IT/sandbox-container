FROM debian:latest
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update; \
  apt-get upgrade; \
  apt-get --no-install-recommends --yes install openssh-server curl
RUN curl debian.imatic.cz/install.sh | /bin/bash
RUN apt-get --yes install imt-bash-lib
COPY entrypoint.sh /entrypoint.sh
CMD /entrypoint.sh
