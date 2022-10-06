FROM debian

USER root

SHELL [ "/bin/bash", "-l", "-c" ]

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update -q && \
    apt-get install -qy procps curl ca-certificates gnupg2 build-essential --no-install-recommends && apt-get clean

# Install RVM
RUN gpg2 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
RUN curl -sSL https://get.rvm.io | bash -s stable

# Enable RVM commands
RUN . /usr/local/rvm/scripts/rvm

ENTRYPOINT ["/bin/bash", "-l", "-c","bash"]