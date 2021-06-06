#!/usr/bin/env zsh

set -e

source ./env.sh

if [ ! -f ./zvbi-0.2.35.tar.bz2 ]; then
  curl -OL https://raw.githubusercontent.com/cntrump/build_ffmpeg_brew/master/zvbi-0.2.35.tar.bz2
fi

if [ ! -d ./zvbi-0.2.35 ]; then
  tar -jxvf ./zvbi-0.2.35.tar.bz2
fi

cd ./zvbi-0.2.35
LDFLAGS=-L/usr/lib \
./configure --prefix=/usr/local --disable-dependency-tracking --without-doxygen \
            --without-libiconv-prefix --disable-shared --enable-static
make -j ${CPU_NUM} && sudo make install
cd ..