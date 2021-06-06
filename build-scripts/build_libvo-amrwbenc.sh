#!/usr/bin/env zsh

set -e

source ./env.sh

if [ ! -f ./vo-amrwbenc-0.1.3.tar.gz ]; then
  curl -OL https://raw.githubusercontent.com/cntrump/build_ffmpeg_brew/master/vo-amrwbenc-0.1.3.tar.gz
fi

if [ ! -d ./vo-amrwbenc-0.1.3 ]; then
  tar -zxvf ./vo-amrwbenc-0.1.3.tar.gz
fi

cd ./vo-amrwbenc-0.1.3
./configure --prefix=/usr/local --disable-shared
make -j ${CPU_NUM} && sudo make install
cd ..