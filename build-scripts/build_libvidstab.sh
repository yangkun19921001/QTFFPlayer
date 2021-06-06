#!/usr/bin/env zsh

set -e

source ./env.sh

if [ ! -d ./libvidstab ];then
  git clone --depth=1 https://github.com/georgmartius/vid.stab.git libvidstab
fi

cd ./libvidstab
mkdir -p build && cd build
cmake -DCMAKE_INSTALL_PREFIX=/usr/local -DBUILD_SHARED_LIBS=OFF -DUSE_OMP=OFF ..
make -j ${CPU_NUM} && sudo make install
cd ../..