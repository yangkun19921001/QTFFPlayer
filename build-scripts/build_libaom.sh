#!/usr/bin/env zsh

set -e

source ./env.sh

if [ ! -d ./libaom ]; then
  git clone --depth=1 https://aomedia.googlesource.com/aom.git libaom
fi

cd ./libaom
mkdir -p build && cd build
cmake -DCMAKE_INSTALL_PREFIX=/usr/local -DBUILD_SHARED_LIBS=OFF -DENABLE_DOCS=OFF -DENABLE_EXAMPLES=OFF -DENABLE_TESTDATA=OFF -DENABLE_TESTS=OFF -DENABLE_TOOLS=OFF ..
make -j ${CPU_NUM} && sudo make install
cd ../..