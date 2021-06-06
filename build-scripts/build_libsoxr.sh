#!/usr/bin/env zsh

set -e

source ./env.sh

if [ ! -f ./openmp-12.0.0.src.tar.xz ];then
  curl -OL https://github.com/llvm/llvm-project/releases/download/llvmorg-12.0.0/openmp-12.0.0.src.tar.xz
fi

if [ ! -d ./openmp-12.0.0.src ];then
  tar -xzvf ./openmp-12.0.0.src.tar.xz
fi

cd ./openmp-12.0.0.src
mkdir -p build && cd build
cmake -DCMAKE_INSTALL_PREFIX=/usr/local -DLIBOMP_INSTALL_ALIASES=OFF -DLIBOMP_ENABLE_SHARED=OFF ..
make -j ${CPU_NUM} && sudo make install
cd ../..

################################################################################################

if [ ! -f ./soxr-0.1.3-Source.tar.xz ];then
  curl -OL https://downloads.sourceforge.net/project/soxr/soxr-0.1.3-Source.tar.xz
fi

if [ ! -d ./soxr-0.1.3-Source ];then
  tar -xzvf ./soxr-0.1.3-Source.tar.xz
fi

cd ./soxr-0.1.3-Source
mkdir -p build && cd build
cmake -DCMAKE_INSTALL_PREFIX=/usr/local -DBUILD_SHARED_LIBS=OFF -DBUILD_TESTS=OFF ..
make -j ${CPU_NUM} && sudo make install
cd ..