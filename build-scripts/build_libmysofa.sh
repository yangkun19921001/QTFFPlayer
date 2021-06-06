#!/usr/bin/env zsh

set -e

source ./env.sh

if [ ! -d ./libmysofa ]; then
  git clone --depth=1 https://github.com/hoene/libmysofa.git libmysofa
fi

cd ./libmysofa/build
cmake -DCMAKE_INSTALL_PREFIX=/usr/local -DBUILD_SHARED_LIBS=OFF -DBUILD_TESTS=OFF ..
make -j ${CPU_NUM} install mysofa-static
cd ../..