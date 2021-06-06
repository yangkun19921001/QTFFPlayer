#!/usr/bin/env zsh

set -e

source ./env.sh

if [ ! -d ./libsdl2 ];then
  git clone --depth=1 https://github.com/libsdl-org/SDL.git libsdl2
fi

cd ./libsdl2
./autogen.sh
./configure --prefix=/usr/local --without-x --enable-hidapi --enable-static --disable-shared
make -j ${CPU_NUM} && sudo make install
cd ..