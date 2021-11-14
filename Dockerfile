FROM debian:latest
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update; \
  apt-get upgrade; \
  apt-get --no-install-recommends --yes install openssh-server
RUN echo PermitRootLogin yes >> /etc/ssh/sshd_config
RUN echo PermitEmptyPasswords yes >> /etc/ssh/sshd_config
COPY entrypoint.sh /entrypoint.sh
CMD /entrypoint.sh
