#!/usr/bin/env zsh

set -e

source ./env.sh

if [ ! -f ./opencore-amr-0.1.5.tar.gz ];then
  curl -OL https://downloads.sourceforge.net/project/opencore-amr/opencore-amr/opencore-amr-0.1.5.tar.gz
fi

if [ ! -d ./opencore-amr-0.1.5 ];then
  tar -xzvf ./opencore-amr-0.1.5.tar.gz
fi

cd ./opencore-amr-0.1.5
./configure --prefix=/usr/local --disable-dependency-tracking --disable-shared --enable-static
make -j ${CPU_NUM} && sudo make install
cd ..