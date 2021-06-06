#!/usr/bin/env zsh

set -e

source ./env.sh

if [ ! -f ./xvidcore-1.3.7.tar.bz2 ];then
  curl -OL https://downloads.xvid.com/downloads/xvidcore-1.3.7.tar.bz2
fi

if [ ! -d ./xvidcore ];then
  tar -xjvf ./xvidcore-1.3.7.tar.bz2
fi

cd ./xvidcore/build/generic
./configure --prefix=/usr/local --disable-assembly --enable-static --disable-shared
make -j ${CPU_NUM} && sudo make install
cd ../../..