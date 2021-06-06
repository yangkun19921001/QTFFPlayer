#!/usr/bin/env zsh

set -e

source ./env.sh

if [ ! -f ./xavs.tar.bz2 ]; then
  curl -OL https://raw.githubusercontent.com/cntrump/build_ffmpeg_brew/master/xavs.tar.bz2
fi

if [ ! -d ./xavs ]; then
  tar -jxvf ./xavs.tar.bz2
fi

cd ./xavs
./configure --prefix=/usr/local --host=x86_64-darwin --disable-asm
make -j ${CPU_NUM} && sudo make install
cd ..