#!/usr/bin/env zsh

set -e

source ./env.sh

if [ ! -d ./libsnappy ];then
  git clone --depth=1 https://github.com/google/snappy.git libsnappy
fi

cd ./libsnappy
mkdir -p build && cd build
cmake -DCMAKE_INSTALL_PREFIX=/usr/local -DBUILD_SHARED_LIBS=OFF -DSNAPPY_BUILD_TESTS=OFF -DSNAPPY_BUILD_BENCHMARKS=OFF ..
make -j ${CPU_NUM} && sudo make install
cd ../..