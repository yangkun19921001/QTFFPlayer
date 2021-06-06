#!/usr/bin/env zsh

set -e

source ./env.sh

if [ ! -f ./libtheora-1.1.1.tar.bz2 ];then
  curl -OL https://downloads.xiph.org/releases/theora/libtheora-1.1.1.tar.bz2
fi

if [ ! -d ./libtheora-1.1.1 ];then
  tar -xzvf ./libtheora-1.1.1.tar.bz2
fi

cd ./libtheora-1.1.1
./autogen.sh
./configure --prefix=/usr/local --disable-dependency-tracking --disable-oggtest --disable-vorbistest --disable-examples --enable-static --disable-shared
make -j ${CPU_NUM} && sudo make install
cd ..