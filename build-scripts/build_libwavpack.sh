#!/usr/bin/env zsh

set -e

source ./env.sh

if [ ! -d ./libwavpack ];then
  git clone --depth=1 https://github.com/dbry/WavPack.git libwavpack
fi

cd ./libwavpack
./autogen.sh
./configure --prefix=/usr/local --disable-dependency-tracking --disable-apps --enable-static --disable-shared
make -j ${CPU_NUM} && sudo make install
cd ..