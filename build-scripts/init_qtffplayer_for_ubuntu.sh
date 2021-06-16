#!/bin/bash

#https://blog.avdancedu.com/f3f66133/

set -e

FFMPEG_VERSION=4.4
FFMPEG_PREFIX=$(pwd)/../../../libs/
export CC=/usr/bin/clang-10
export CPP=/usr/bin/clang-cpp-10
export CXX=/usr/bin/clang++-10
export LD=/usr/bin/ld.lld-10


if [ ! -d "../src" ]; then
  mkdir ../source
  if [ ! -d "../src/ffmpeg" ]; then
  mkdir ../src/ffmpeg
  fi
fi


chmod +x init_library_for_ubuntu.sh
./init_library_for_ubuntu.sh

cd ../src/ffmpeg

echo $PWD

if [ ! -d "ffmpeg-4.4" ]; then  
  wget https://ffmpeg.org/releases/ffmpeg-$FFMPEG_VERSION.tar.bz2
  tar -xvf ffmpeg-4.4.tar.bz2
fi

cd ffmpeg-4.4
FFMPEG_PREFIX=$(pwd)/../../../libs/
echo $FFMPEG_PREFIX

rm -rf $FFMPEG_PREFIX

./configure \
--prefix=$FFMPEG_PREFIX \
--enable-shared  \
--disable-static  \
--enable-pthreads  \
--enable-gpl  \
--enable-nonfree \
--enable-libmp3lame  \
--enable-libsnappy  \
--enable-libtheora  \
--enable-libx264  \
--enable-libx265  \
--enable-libfdk-aac \
--enable-libfontconfig  \
--enable-libfreetype  \
--enable-libspeex \

make -j8
make install

cd ../../../libs/
ls -lht











