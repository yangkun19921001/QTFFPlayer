#!/usr/bin/env zsh

set -e

source ./env.sh

ver="3.5"

if [ ! -f "./x265_${ver}.tar.gz" ];then
  curl -OL "https://bitbucket.org/multicoreware/x265_git/downloads/x265_${ver}.tar.gz"
fi

if [ ! -d "./x265_${ver}" ];then
  tar -xzvf "./x265_${ver}.tar.gz"
fi

cd "./x265_${ver}/source"

mkdir -p ./8bit

mkdir -p ./10bit && cd ./10bit
cmake -DCMAKE_INSTALL_PREFIX=/usr/local -DENABLE_HDR10_PLUS=ON -DHIGH_BIT_DEPTH=ON -DEXPORT_C_API=OFF -DENABLE_SHARED=OFF -DENABLE_CLI=OFF ..
make -j ${CPU_NUM}
mv ./libx265.a ../8bit/libx265_main10.a
cd ..

mkdir -p ./12bit && cd ./12bit
cmake -DCMAKE_INSTALL_PREFIX=/usr/local -DMAIN12=ON -DHIGH_BIT_DEPTH=ON -DEXPORT_C_API=OFF -DENABLE_SHARED=OFF -DENABLE_CLI=OFF ..
make -j ${CPU_NUM}
mv ./libx265.a ../8bit/libx265_main12.a
cd ..

cd ./8bit
cmake -DCMAKE_INSTALL_PREFIX=/usr/local -DENABLE_SHARED=OFF -DLINKED_10BIT=ON -DLINKED_12BIT=ON -DEXTRA_LINK_FLAGS="-L." -DEXTRA_LIB="x265_main10.a;x265_main12.a" ..
make -j ${CPU_NUM}
mv ./libx265.a ./libx265_main.a

libtool -static -o ./libx265.a ./libx265_main.a ./libx265_main10.a ./libx265_main12.a
make install
cd ..

cd ../../..