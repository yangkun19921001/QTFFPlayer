#!/usr/bin/env zsh

set -e

source ./env.sh

if [ ! -f ./ffmpeg-${FFMPEG_VERSION}.tar.bz2 ]; then
  curl -OL https://ffmpeg.org/releases/ffmpeg-${FFMPEG_VERSION}.tar.bz2
fi

if [ ! -d ./ffmpeg-${FFMPEG_VERSION} ]; then
  tar -jxvf ./ffmpeg-${FFMPEG_VERSION}.tar.bz2
fi

cd ./ffmpeg-${FFMPEG_VERSION}

echo Building ffmpeg-${FFMPEG_VERSION} ...

./configure --prefix=/usr/local --extra-version=lvv.me \
            --enable-avisynth --enable-fontconfig --enable-gpl --enable-libaom --enable-libass --enable-libbluray --enable-libdav1d --enable-libfreetype --enable-libgsm --enable-libmodplug --enable-libmp3lame --enable-libmysofa --enable-libopencore-amrnb --enable-libopencore-amrwb --enable-libopenh264 --enable-libopenjpeg --enable-libopus --enable-librubberband --enable-libshine --enable-libsnappy --enable-libsoxr --enable-libspeex --enable-libtheora --enable-libtwolame --enable-libvidstab --enable-libvmaf --enable-libvo-amrwbenc --enable-libvorbis --enable-libvpx --enable-libwebp --enable-libx264 --enable-libx265 --enable-libxavs --enable-libxvid --enable-libzimg --enable-libzmq --enable-libzvbi --enable-version3 --pkg-config-flags=--static --disable-ffplay \
            --enable-iconv --enable-nonfree --enable-libfdk-aac --enable-openssl --enable-lto \
            --extra-cflags="-DTARGET_OS_OSX=1 -I/opt/local/openssl@1.1/include -I/usr/local/include -I/usr/local/include/libvmaf -I${SDKROOT}/usr/include" \
            --extra-ldflags="-L/opt/local/openssl@1.1/lib -L/usr/local/lib -L${SDKROOT}/usr/lib -framework Accelerate -lc++ -lz -lbrotlidec -lomp -liconv"

make -j ${CPU_NUM}
make install

/usr/local/bin/ffmpeg -version

lipo -info /usr/local/bin/ffmpeg
otool -L /usr/local/bin/ffmpeg | grep /usr/local

echo Build ffmpeg-${FFMPEG_VERSION} finished.