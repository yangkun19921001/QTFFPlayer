#!/usr/bin/env zsh

set -e

source ./env.sh

if [ ! -d ./libsodium ];then
  git clone --depth=1 https://github.com/jedisct1/libsodium.git libsodium
fi

cd ./libsodium
./autogen.sh -b -s
./configure --prefix=/usr/local --disable-dependency-tracking --disable-debug --enable-static --disable-shared
make -j ${CPU_NUM} && sudo make install
cd ..

if [ ! -d ./libzmq ];then
  git clone --depth=1 https://github.com/zeromq/libzmq.git libzmq
fi

cd ./libzmq
./autogen.sh
./configure --prefix=/usr/local --disable-dependency-tracking --without-docs --with-libsodium --enable-static --disable-shared
make -j ${CPU_NUM} && sudo make install
cd ..