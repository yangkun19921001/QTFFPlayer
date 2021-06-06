#!/usr/bin/env zsh

set -e

source ./env.sh

if [ ! -d ./libass ];then
  git clone --depth=1 https://github.com/libass/libass.git libass
fi

cd ./libass
autoreconf -i
./configure --prefix=/usr/local --disable-dependency-tracking --disable-fontconfig --enable-static --disable-shared
make -j ${CPU_NUM} && sudo make install
cd ..