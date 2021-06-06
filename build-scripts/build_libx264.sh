#!/usr/bin/env zsh

set -e

source ./env.sh

if [ ! -d ./libx264 ];then
  git clone --depth=1 https://code.videolan.org/videolan/x264.git libx264
fi

cd ./libx264
./configure --prefix=/usr/local --disable-lsmash --disable-swscale --disable-ffms --enable-strip --enable-static
make -j ${CPU_NUM} && sudo make install
cd ..