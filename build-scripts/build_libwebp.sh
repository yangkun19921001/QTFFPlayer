#!/usr/bin/env zsh

set -e

source ./env.sh

if [ ! -d ./libwebp ];then
  git clone --depth=1 https://chromium.googlesource.com/webm/libwebp.git libwebp
fi

cd ./libwebp
./autogen.sh
./configure --prefix=/usr/local --disable-dependency-tracking --disable-gif --disable-gl --enable-libwebpdecoder --enable-libwebpdemux --enable-libwebpmux --enable-static --disable-shared
make -j ${CPU_NUM} && sudo make install
cd ..