#!/usr/bin/env bash

set -e

usage() {
  echo "Usage: $0 <target-directory>"
}

if [ $# -ne 1 ]; then
  usage
  exit 1
fi

directory=$1

if [ -e "${directory}" ]; then
  echo "Error: \"${directory}\" already exists."
  usage
fi

# create the directory
mkdir -p "${directory}" && cd "${directory}"

# clone poky and other layers
git clone -b kirkstone git://git.yoctoproject.org/poky.git poky
git clone -b kirkstone https://github.com/agherzan/meta-raspberrypi.git meta-raspberrypi
git clone -b kirkstone https://github.com/openembedded/meta-openembedded.git meta-openembedded

echo "Done, type \"cd ${directory} && . ./poky/oe-init-build-env\" to create the build environment"
