#!/usr/bin/env zsh

set -e

source ./env.sh

if [ ! -f ./fdk-aac-2.0.1.tar.gz ];then
  curl -OL https://downloads.sourceforge.net/project/opencore-amr/fdk-aac/fdk-aac-2.0.1.tar.gz
fi

if [ ! -d ./fdk-aac-2.0.1 ];then
  tar -xzvf ./fdk-aac-2.0.1.tar.gz
fi

cd ./fdk-aac-2.0.1
./configure --prefix=/usr/local --disable-dependency-tracking --enable-static --disable-shared
make -j ${CPU_NUM} && sudo make install
cd ..