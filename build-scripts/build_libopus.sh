#!/usr/bin/env zsh

set -e

source ./env.sh

if [ ! -f ./opus-1.3.1.tar.gz ];then
  curl -OL https://archive.mozilla.org/pub/opus/opus-1.3.1.tar.gz
fi

if [ ! -d ./opus-1.3.1 ];then
  tar -xzvf ./opus-1.3.1.tar.gz
fi

cd ./opus-1.3.1
./configure --prefix=/usr/local --disable-dependency-tracking --disable-doc --disable-shared --enable-static
make -j ${CPU_NUM} && sudo make install
cd ..