#!/usr/bin/env zsh

set -e

source ./env.sh

if [ ! -f ./dav1d-0.8.2.tar.bz2 ];then
  curl -OL https://code.videolan.org/videolan/dav1d/-/archive/0.8.2/dav1d-0.8.2.tar.bz2
fi

if [ ! -d ./dav1d-0.8.2 ];then
  tar -jxvf ./dav1d-0.8.2.tar.bz2
fi

cd ./dav1d-0.8.2
if [ -d build ];then
  rm -rf build
fi
meson build --buildtype=release --prefix=/usr/local -Ddefault_library=static -Dno_shared=true
ninja install -C build
cd ..
