#!/bin/bash
#参考 https://lvv.me/blog/posts/2020/04/14_build_ffmpeg/
#https://blog.avdancedu.com/f3f66133/

set -e

FFMPEG_VERSION=4.4
FFMPEG_PREFIX=$(pwd)/../libs/


if [ ! -d "../source" ]; then
  mkdir ../source
  if [ ! -d "../source/ffmpeg" ]; then
  mkdir ../source/ffmpeg
  fi
fi

TARGET=$1


if [ $TARGET == "mac" ]
then
  echo "mac"
  chmod +x init_library_for_macos.sh
  ./init_library_for_macos.sh
elif [ $TARGET == "ubuntu" ]
then
  echo "ubuntu"
  chmod +x init_library_for_ubuntu.sh
  ./init_library_for_ubuntu.sh
else
   echo "not found $1"
fi


cd ../source/ffmpeg

echo $PWD


if [ ! -d "ffmpeg-4.4" ]; then  
  wget https://ffmpeg.org/releases/ffmpeg-4.4.tar.bz2
  tar -zxvf ffmpeg-4.4.tar.bz2
fi

cd ffmpeg-$FFMPEG_VERSION
echo "--->$(pwd)"

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


