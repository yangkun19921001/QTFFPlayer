#!/usr/bin/env zsh

set -e

source ./env.sh

if [ ! -f ./tiff-4.3.0.tar.gz ];then
  curl -OL https://download.osgeo.org/libtiff/tiff-4.3.0.tar.gz
fi

if [ ! -d ./tiff-4.3.0 ];then
  tar -xzvf ./tiff-4.3.0.tar.gz
fi

cd ./tiff-4.3.0
./configure --prefix=/usr/local --enable-static --disable-shared --disable-cxx
make -j ${CPU_NUM} && sudo make install
cd ..

if [ ! -d ./libopenjpeg ];then
  git clone --depth=1 https://github.com/uclouvain/openjpeg.git libopenjpeg
fi

cd ./libopenjpeg
mkdir -p build && cd build
cmake -DCMAKE_INSTALL_PREFIX=/usr/local -DBUILD_SHARED_LIBS=OFF -DBUILD_CODEC=OFF -DBUILD_MJ2=OFF -DBUILD_JPWL=OFF -DBUILD_JPIP=OFF -DCMAKE_BUILD_TYPE=Release ..
make -j ${CPU_NUM} && sudo make install
cd ../..