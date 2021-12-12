FROM debian:latest
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update; \
  apt-get upgrade; \
  apt-get --no-install-recommends --yes install openssh-server curl python
RUN curl debian.imatic.cz/install.sh | /bin/bash
RUN apt-get --yes install imt-bash-lib imt-vim git
#Accept GIT_* env for setup GIT commit variables
RUN sed -i 's/AcceptEnv LANG LC_\*/AcceptEnv LANG LC_* GIT_*/' /etc/ssh/sshd_config
COPY entrypoint.sh /entrypoint.sh
CMD /entrypoint.sh
