# this image augments Ubuntu 20.04 "latest" with the minimum necessary to run Yocto with support for QEMU and devtool
FROM ubuntu:20.04
MAINTAINER Abidi-Nidhal <>

# Set Local Time
ENV TZ=Africa/Tunis
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Upgrade system, add Yocto Project basic dependencies and extras
RUN apt-get update && apt-get -y upgrade && apt-get -y install dialog apt-utils kmod gawk wget git-core diffstat unzip texinfo \
gcc-multilib build-essential chrpath socat cpio python python3 python3-pip python3-pexpect xz-utils debianutils \
iputils-ping libsdl1.2-dev xterm curl vim tzdata tree zstd lz4 iproute2

# for tunctl (qemu)
RUN apt-get -y install uml-utilities

# for toaster
RUN apt-get -y install python3-venv daemon

# for package feeds
RUN apt-get -y install lighttpd

# for bitbake -g
RUN apt-get -y install python3-gi python3-pip python3-aptdaemon.gtk3widgets

# Set up locales
RUN apt-get -y install locales apt-utils sudo && dpkg-reconfigure locales && locale-gen en_US.UTF-8 && update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
ENV LANG en_US.utf8

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Replace dash with bash
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# Install repo "https://source.android.com/setup/develop"
RUN curl -o /usr/local/bin/repo https://storage.googleapis.com/git-repo-downloads/repo && chmod a+x /usr/local/bin/repo
