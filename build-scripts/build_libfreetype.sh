#!/usr/bin/env zsh

set -e

source ./env.sh

if [ ! -d ./libbrotli ];then
  git clone --depth=1 https://github.com/google/brotli.git libbrotli
fi

cd ./libbrotli
mkdir -p out && cd out
cmake -DCMAKE_INSTALL_PREFIX=/usr/local ..
make -j ${CPU_NUM} && sudo make install
cd ../..

rm /usr/local/lib/libbrotli*.dylib
ln -sf /usr/local/lib/libbrotlicommon-static.a /usr/local/lib/libbrotlicommon.a
ln -sf /usr/local/lib/libbrotlidec-static.a /usr/local/lib/libbrotlidec.a
ln -sf /usr/local/lib/libbrotlienc-static.a /usr/local/lib/libbrotlienc.a

ver=2.10.4

if [ ! -f ./freetype-${ver}.tar.xz ];then
  curl -OL https://downloads.sourceforge.net/project/freetype/freetype2/${ver}/freetype-${ver}.tar.xz
fi

if [ ! -d ./freetype-${ver} ];then
  tar -xzvf ./freetype-${ver}.tar.xz
fi

cd ./freetype-${ver}
./configure --prefix=/usr/local --enable-freetype-config --without-harfbuzz --enable-static --disable-shared
make -j ${CPU_NUM} && sudo make install
cd ..