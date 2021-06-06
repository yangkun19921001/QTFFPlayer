#!/bin/bash

#参考 https://lvv.me/blog/posts/2020/04/14_build_ffmpeg/

if [ ! -d "../source" ]; then
  mkdir ../source
  if [ ! -d "../source/ffmpeg" ]; then
  mkdir ../source/ffmpeg
  fi
fi


./init_library_for_macos.sh

cd ../source/ffmpeg

echo $PWD


# if [ ! -d "ffmpeg-4.4" ]; then  
#   wget https://ffmpeg.org/releases/ffmpeg-4.4.tar.bz2
#   tar -zxvf ffmpeg-4.4.tar.bz2
# fi

cd ffmpeg-4.4
echo --->$(pwd)
FFMPEG_PREFIX=$(pwd)/../../../libs/
echo --->$FFMPEG_PREFIX

rm -rf $FFMPEG_PREFIX


./configure \
--prefix=$FFMPEG_PREFIX \
--enable-shared  \
--disable-static  \
--enable-pthreads  \
--enable-version3  \
--enable-avresample  \
--cc=clang  \
--host-cflags=  \
--host-ldflags=  \
--disable-ffplay  \
--disable-ffmpeg  \
--disable-ffprobe  \
--enable-gnutls  \
--enable-gpl  \
--enable-libaom  \
--enable-libbluray  \
--enable-libdav1d  \
--enable-libmp3lame  \
--enable-libopus  \
--enable-librubberband  \
--enable-libsnappy  \
--enable-libtesseract  \
--enable-libtheora  \
--enable-libvidstab  \
--enable-libvorbis  \
--enable-libvpx  \
--enable-libwebp  \
--enable-libx264  \
--enable-libx265  \
--enable-libxml2  \
--enable-libxvid  \
--enable-lzma  \
--enable-libfontconfig  \
--enable-libfreetype  \
--enable-frei0r  \
--enable-libass  \
--enable-libopencore-amrnb  \
--enable-libopencore-amrwb  \
--enable-libopenjpeg  \
--enable-libspeex  \
--enable-libsoxr  \
--enable-videotoolbox  \
--enable-libzmq  \
--enable-libzimg  \
--disable-libjack  \
--disable-indev=jack \


make -j8
make install

cd ../../../libs/
ls -lht
