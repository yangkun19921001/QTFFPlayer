#!/usr/bin/env zsh

set -e

source ./env.sh

if [ ! -f ./libmodplug-0.8.9.0.tar.gz ];then
  curl -OL https://downloads.sourceforge.net/project/modplug-xmms/libmodplug/0.8.9.0/libmodplug-0.8.9.0.tar.gz
fi

if [ ! -d ./libmodplug-0.8.9.0 ];then
  tar -xzvf ./libmodplug-0.8.9.0.tar.gz
fi

cd ./libmodplug-0.8.9.0
./configure --prefix=/usr/local --disable-dependency-tracking --disable-silent-rules --enable-static --disable-shared
make -j ${CPU_NUM} && sudo make install
cd ..