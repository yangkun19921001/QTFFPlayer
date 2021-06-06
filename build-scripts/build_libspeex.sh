#!/usr/bin/env zsh

set -e

source ./env.sh

if [ ! -f ./libogg-1.3.3.tar.gz ];then
  curl -OL https://downloads.xiph.org/releases/ogg/libogg-1.3.3.tar.gz
fi

if [ ! -d ./libogg-1.3.3 ];then
  tar -xzvf ./libogg-1.3.3.tar.gz
fi

cd ./libogg-1.3.3
autoreconf -i
./configure --prefix=/usr/local --disable-dependency-tracking --enable-static --disable-shared
make -j ${CPU_NUM} && sudo make install
cd ..

#############################################################################################################

if [ ! -f ./libvorbis-1.3.7.tar.xz ];then
  curl -OL https://downloads.xiph.org/releases/vorbis/libvorbis-1.3.7.tar.xz
fi

if [ ! -d ./libvorbis-1.3.7 ]; then
  tar -xzvf ./libvorbis-1.3.7.tar.xz
fi

cd ./libvorbis-1.3.7
./autogen.sh
./configure --prefix=/usr/local --disable-dependency-tracking --enable-static --disable-shared
make -j ${CPU_NUM} && sudo make install
cd ..

#############################################################################################################

if [ ! -d libsndfile ];then
  git clone --depth=1 -b 1.0.31 https://github.com/libsndfile/libsndfile.git libsndfile
fi

cd ./libsndfile
autoreconf -ivf
./configure --prefix=/usr/local --disable-dependency-tracking --enable-static --disable-shared
make -j ${CPU_NUM} && sudo make install
cd ..

#############################################################################################################

if [ ! -f ./libsamplerate-0.1.9.tar.gz ];then
  curl -OL http://www.mega-nerd.com/SRC/libsamplerate-0.1.9.tar.gz
fi

if [ ! -d ./libsamplerate-0.1.9 ];then
  tar -xzvf ./libsamplerate-0.1.9.tar.gz
fi

cd ./libsamplerate-0.1.9
./configure --prefix=/usr/local --disable-dependency-tracking --enable-static --disable-shared
make -j ${CPU_NUM} && sudo make install
cd ..

#############################################################################################################

if [ ! -f ./speex-1.2.0.tar.gz ];then
  curl -OL https://downloads.xiph.org/releases/speex/speex-1.2.0.tar.gz
fi

if [ ! -d ./speex-1.2.0 ];then
  tar -xzvf ./speex-1.2.0.tar.gz
fi

cd ./speex-1.2.0
./configure --prefix=/usr/local --disable-debug --disable-dependency-tracking --enable-static --disable-shared
make -j ${CPU_NUM} && sudo make install
cd ..