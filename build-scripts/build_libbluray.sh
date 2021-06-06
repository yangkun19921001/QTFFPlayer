#!/usr/bin/env zsh

set -e

source ./env.sh

if [ ! -f ./libbluray-1.3.0.tar.bz2 ];then
  curl -OL https://download.videolan.org/videolan/libbluray/1.3.0/libbluray-1.3.0.tar.bz2
fi

if [ ! -d ./libbluray-1.3.0 ];then
  tar -jxvf ./libbluray-1.3.0.tar.bz2
fi

cd ./libbluray-1.3.0
./bootstrap
./configure --prefix=/usr/local --disable-dependency-tracking --disable-silent-rules --disable-bdjava-jar --disable-examples --enable-static --disable-shared
make -j ${CPU_NUM} && sudo make install
cd ..