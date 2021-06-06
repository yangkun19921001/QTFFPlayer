#!/usr/bin/env zsh

set -e

source ./env.sh

if [ ! -f ./twolame-0.4.0.tar.gz ];then
  curl -OL https://downloads.sourceforge.net/project/twolame/twolame/0.4.0/twolame-0.4.0.tar.gz
fi

if [ ! -d ./twolame-0.4.0 ];then
  tar -xzvf ./twolame-0.4.0.tar.gz
fi

cd ./twolame-0.4.0
./configure --prefix=/usr/local --disable-dependency-tracking --enable-static --disable-shared
make -j ${CPU_NUM} && sudo make install
cd ..