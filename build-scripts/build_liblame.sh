#!/usr/bin/env zsh

set -e

source ./env.sh

if [ ! -f ./lame-3.100.tar.gz ];then
  curl -OL https://downloads.sourceforge.net/project/lame/lame/3.100/lame-3.100.tar.gz
fi

if [ ! -d ./lame-3.100 ];then
  tar -xzvf ./lame-3.100.tar.gz
fi

cd ./lame-3.100
./configure --prefix=/usr/local --disable-dependency-tracking --disable-debug --enable-nasm --enable-static --disable-shared
make -j ${CPU_NUM} && sudo make install
cd ..