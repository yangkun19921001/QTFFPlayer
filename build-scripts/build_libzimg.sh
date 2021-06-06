#!/usr/bin/env zsh

set -e

source ./env.sh

if [ ! -d ./libzimg ];then
  git clone --depth=1 https://github.com/sekrit-twc/zimg.git libzimg
fi

cd ./libzimg
./autogen.sh
./configure --prefix=/usr/local --enable-static --disable-shared
make -j ${CPU_NUM} && sudo make install
cd ..