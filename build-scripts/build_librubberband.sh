#!/usr/bin/env zsh

set -e

source ./env.sh

if [ ! -f ./rubberband-1.9.1.tar.bz2 ];then
  curl -OL https://breakfastquay.com/files/releases/rubberband-1.9.1.tar.bz2
fi

if [ ! -d ./rubberband-1.9.1 ];then
  tar -xjvf ./rubberband-1.9.1.tar.bz2
fi

cd ./rubberband-1.9.1
if [ -d build ];then
  rm -rf build
fi
meson build --buildtype=release --prefix=/usr/local -Dno_shared=true -Dfft=vdsp -Dresampler=libsamplerate
ninja -C build install
cd ..
