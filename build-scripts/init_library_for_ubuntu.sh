#!/bin/bash

#参考 http://www.manks.top/ffmpeg-install-linux-centos.html#_label5

sudo apt-get update && sudo apt-get install autoconf automake  libfreetype6-dev  libtool make pkg-config zlib1g zlib1g.dev clang yasm yasm libgnutls28-dev \
 nasm  libx264-dev  libnuma-dev \
 libx265-dev libnuma-dev libvpx-dev \
 libfdk-aac-dev libmp3lame-dev libopus-dev \
 libspeex-dev frei0r-plugins-dev libsdl2-2.0 libsdl2-dev libxss1 \


sudo apt-get install python3-pip && \
pip3 install --user meson \



if [ ! -d "../src" ]; then
  mkdir ../src
fi


# cd ../src/
# PREFIX=$(pwd)/../libs/

# #编译 nasm
# echo ">>>>>>> start build nasm <<<<<<<<<"
# curl -O -L https://www.nasm.us/pub/nasm/releasebuilds/2.15.05/nasm-2.15.05.tar.bz2
# tar xjvf nasm-2.15.05.tar.bz2
# cd nasm-2.15.05
# ./autogen.sh
# ./configure --prefix="$PREFIX" --bindir="$PREFIX/nasm-2.15.05/bin"
# make
# make install
# ln -s $PREFIX/nasm-2.15.05/bin/nasm /usr/bin/nasm
# cd ..

# #编译 yasm
# echo ">>>>>>> start build yasm <<<<<<<<<"
# curl -O -L https://www.tortall.net/projects/yasm/releases/yasm-1.3.0.tar.gz
# tar xzvf yasm-1.3.0.tar.gz
# cd yasm-1.3.0
# ./configure --prefix="$PREFIX" --bindir="$PREFIX/yasm-1.3.0/bin"
# make
# make install
# ln -s $PREFIX/yasm-1.3.0/bin/yasm /usr/bin/yasm
# cd ..


# #编译 libx264
# echo ">>>>>>> start build libx264 <<<<<<<<<"
# git clone --branch stable --depth 1 https://code.videolan.org/videolan/x264.git
# cd x264
# PKG_CONFIG_PATH="$PREFIX/pkgconfig" ./configure --prefix="$PREFIX" --bindir="$PREFIX/x264/bin" --enable-static
# make
# make install
# cd ..

# #编译 libx265
# echo ">>>>>>> start build libx265 <<<<<<<<<"
# git clone --branch stable --depth 2 https://bitbucket.org/multicoreware/x265_git
# cd x265_git/build/linux
# cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX="$PREFIX" -DENABLE_SHARED:bool=off 
# make
# make install
# cd ..


# #编译 libfdk_aac
# echo ">>>>>>> start build libfdk_aac <<<<<<<<<"
# git clone --depth 1 https://github.com/mstorsjo/fdk-aac
# cd fdk-aac
# autoreconf -fiv
# ./configure --prefix="$PREFIX" --disable-shared
# make
# make install
# cd ..

# #编译 libmp3lame
# echo ">>>>>>> start build libmp3lame <<<<<<<<<"
# curl -O -L https://downloads.sourceforge.net/project/lame/lame/3.100/lame-3.100.tar.gz
# tar xzvf lame-3.100.tar.gz
# cd lame-3.100
# ./configure --prefix="$PREFIX" --bindir="$PREFIX/lame-3.100/bin" --disable-shared --enable-nasm
# make
# make install
# cd ..


# #编译 libopus
# echo ">>>>>>> start build libopus <<<<<<<<<"
# curl -O -L https://archive.mozilla.org/pub/opus/opus-1.3.1.tar.gz
# tar xzvf opus-1.3.1.tar.gz
# cd opus-1.3.1
# ./configure --prefix="$PREFIX" --disable-shared
# make
# make install
# cd ..


# #编译 libvpx
# echo ">>>>>>> start build libvpx <<<<<<<<<"
# git clone --depth 1 https://chromium.googlesource.com/webm/libvpx.git
# cd libvpx
# ./configure --prefix="$PREFIX" --disable-examples --disable-unit-tests --enable-vp9-highbitdepth --as=yasm
# make
# make install
# cd ..






