#!/usr/bin/env zsh

set -e

source ./env.sh

if [ ! -d ./libopenh264 ];then
  git clone --depth=1 https://github.com/cisco/openh264.git libopenh264
fi

cd ./libopenh264
make -j ${CPU_NUM} STATIC_LDFLAGS=-lc++ install-static
cd ..