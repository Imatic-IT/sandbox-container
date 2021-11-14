FROM debian:latest
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update; \
  apt-get upgrade; \
  apt-get --no-install-recommends --yes install openssh-server curl
COPY entrypoint.sh /entrypoint.sh
CMD /entrypoint.sh
