#!/usr/bin/env zsh

set -e

source ./env.sh

# xorg-macros

ver=1.19.3

if [ ! -f ./util-macros-${ver}.tar.bz2 ];then
  curl -OL https://www.x.org/archive/individual/util/util-macros-1.19.3.tar.bz2
fi

if [ ! -d ./util-macros-${ver} ];then
  tar -xjvf ./util-macros-${ver}.tar.bz2
fi

cd ./util-macros-${ver}
./configure --prefix=/usr/local --enable-static --disable-shared
make -j ${CPU_NUM} && sudo make install
cd ..

ver=2021.3

if [ ! -f ./xorgproto-${ver}.tar.bz2 ];then
  curl -OL https://xorg.freedesktop.org/archive/individual/proto/xorgproto-${ver}.tar.bz2
fi

if [ ! -d ./xorgproto-${ver} ];then
  tar -xjvf ./xorgproto-${ver}.tar.bz2
fi

cd ./xorgproto-${ver}
./configure --prefix=/usr/local --disable-dependency-tracking --disable-silent-rules --enable-static --disable-shared
make -j ${CPU_NUM} && sudo make install
cd ..

ver=0.4

if [ ! -f ./libpthread-stubs-${ver}.tar.bz2 ];then
  curl -OL https://xcb.freedesktop.org/dist/libpthread-stubs-${ver}.tar.bz2
fi

if [ ! -d ./libpthread-stubs-${ver} ];then
  tar -xvjf ./libpthread-stubs-${ver}.tar.bz2
fi

cd ./libpthread-stubs-${ver}
./configure --prefix=/usr/local --enable-static --disable-shared
make -j ${CPU_NUM} && sudo make install
cd ..

########################################################################################################################

ver=1.0.9

if [ ! -f ./libXau-${ver}.tar.bz2 ];then
  curl -OL https://www.x.org/archive/individual/lib/libXau-${ver}.tar.bz2
fi

if [ ! -d ./libXau-${ver} ];then
  tar -xzvf ./libXau-${ver}.tar.bz2
fi

cd ./libXau-${ver}
./configure --prefix=/usr/local --disable-dependency-tracking --disable-silent-rules --enable-static --disable-shared
make -j ${CPU_NUM} && sudo make install
cd ..

########################################################################################################################

ver=1.1.3

if [ ! -f ./libXdmcp-1.1.3.tar.bz2 ];then
  curl -OL https://www.x.org/archive/individual/lib/libXdmcp-${ver}.tar.bz2
fi

if [ ! -d ./libXdmcp-${ver} ];then
  tar -xzvf ./libXdmcp-${ver}.tar.bz2
fi

cd ./libXdmcp-${ver}
./configure --prefix=/usr/local --disable-dependency-tracking --disable-silent-rules --enable-docs=no --enable-static --disable-shared
make -j ${CPU_NUM} && sudo make install
cd ..

########################################################################################################################

ver=1.14.1

if [ ! -f ./xcb-proto-${ver}.tar.xz ];then
  curl -OL https://xorg.freedesktop.org/archive/individual/proto/xcb-proto-1.14.1.tar.xz
fi

if [ ! -d ./xcb-proto-${ver} ];then
  tar -xzvf ./xcb-proto-${ver}.tar.xz
fi

cd ./xcb-proto-${ver}
PYTHON=python3 \
./configure --prefix=/usr/local --disable-silent-rules --enable-static --disable-shared
make -j ${CPU_NUM} && sudo make install
cd ..

########################################################################################################################

ver=1.14

if [ ! -f ./libxcb-${ver}.tar.gz ];then
  curl -OL https://xcb.freedesktop.org/dist/libxcb-${ver}.tar.gz
fi

if [ ! -d ./libxcb-${ver} ];then
  tar -xzvf ./libxcb-${ver}.tar.gz
fi

cd ./libxcb-${ver}
./configure --prefix=/usr/local --enable-dri3 --enable-ge --enable-xevie --enable-xprint --enable-selinux \
            --disable-dependency-tracking --disable-silent-rules --enable-devel-docs=no --with-doxygen=no --enable-static --disable-shared
make -j ${CPU_NUM} && sudo make install
cd ..