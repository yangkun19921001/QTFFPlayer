#!/usr/bin/env zsh

set -e

source ./env.sh

if [ ! -d ./libvpx ];then
  git clone --depth=1 https://github.com/webmproject/libvpx.git libvpx
fi

cd ./libvpx/build
../configure --prefix=/usr/local --disable-dependency-tracking --disable-examples --disable-unit-tests --enable-vp9-highbitdepth --disable-avx512 --enable-static --disable-shared
make -j ${CPU_NUM} && sudo make install
cd ../..