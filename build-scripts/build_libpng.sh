#!/usr/bin/env zsh

set -e

source ./env.sh

if [ ! -d ./libpng ];then
  git clone --depth=1 https://github.com/glennrp/libpng.git libpng
fi

cd ./libpng
autoreconf -f -i
./configure --prefix=/usr/local --disable-dependency-tracking --disable-silent-rules --enable-static --disable-shared
make -j ${CPU_NUM} && sudo make install
cd ..

######################################################################################################################

if [ ! -f ./freetype-2.10.4.tar.xz ];then
  curl -OL https://downloads.sourceforge.net/project/freetype/freetype2/2.10.4/freetype-2.10.4.tar.xz
fi

if [ ! -d ./freetype-2.10.4 ];then
  tar -xzvf ./freetype-2.10.4.tar.xz
fi

cd ./freetype-2.10.4
./configure --prefix=/usr/local --enable-freetype-config --without-harfbuzz --enable-static --disable-shared
make -j ${CPU_NUM} && sudo make install
cd ..

######################################################################################################################

if [ ! -d ./icu4c ];then
  git clone --depth=1 https://github.com/unicode-org/icu.git icu4c
fi

cd icu4c/icu4c/source
./configure --prefix=/usr/local --disable-samples --disable-tests --with-library-bits=64 --enable-static --disable-shared
make -j ${CPU_NUM} && sudo make install
cd ../../..

#######################################################################################################################

if [ ! -d ./libfontconfig ];then
  git clone --depth=1 https://gitlab.freedesktop.org/fontconfig/fontconfig.git libfontconfig
fi

cd ./libfontconfig
if [ -d build ];then
  rm -rf build
fi
meson build --buildtype=release --prefix=/usr/local -Ddoc=disabled -Dtests=disabled -Dtools=disabled --default-library=static
ninja -C build install
cd ..

if [ ! -d ./libharfbuzz ];then
  git clone --depth=1 https://github.com/harfbuzz/harfbuzz.git libharfbuzz
fi

cd ./libharfbuzz
if [ -d build ];then
  rm -rf build
fi
meson build --buildtype=release --prefix=/usr/local -Dcairo=disabled -Dcoretext=enabled -Dfreetype=enabled -Dglib=disabled -Dgobject=disabled -Dgraphite=disabled -Dicu=enabled -Dintrospection=disabled -Dtests=disabled --default-library=static
ninja -C build install
cd ..