#!/usr/bin/env zsh

set -e

source ./env.sh

if [ ! -d ./libvmaf ];then
  git clone --depth=1 https://github.com/Netflix/vmaf.git libvmaf
fi

cd ./libvmaf/libvmaf
if [ -d build ];then
  rm -rf build
fi
meson build --buildtype=release --prefix=/usr/local -Ddefault_library=static -Denable_tests=false --buildtype release
ninja -C build install
cd ../..