#!/usr/bin/env zsh

set -e

source ./env.sh

if [ ! -d ./libfribidi ];then
  git clone --depth=1 https://github.com/fribidi/fribidi.git libfribidi
fi

cd ./libfribidi
meson build --buildtype=release --prefix=/usr/local --default-library=static -Ddocs=false -Dtests=false -Dbin=false
ninja -C build install
cd ..