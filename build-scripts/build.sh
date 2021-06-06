#!/usr/bin/env zsh

set -e

port install pkgconfig cmake automake libtool yasm meson ninja nasm
port install clang-11
port select --set clang mp-clang-11

if [ -f /opt/local/bin/nasm ];then
  ln -sf opt/local/bin/nasm /usr/bin/nasm
fi

./build_openssl.sh

./build_libxcb.sh

./build_libsdl2.sh

./build_libfribidi.sh

./build_libintl.sh

./build_libpng.sh

./build_libfreetype.sh

./build_libaom.sh

./build_libass.sh

./build_libbluray.sh

./build_libdav1d.sh

./build_libgsm.sh

./build_libmodplug.sh

./build_libopencore-amr.sh

./build_liblame.sh

./build_libopenh264.sh

./build_libopenjpeg.sh

./build_libopus.sh

./build_libsnappy.sh

./build_libsoxr.sh

./build_libspeex.sh

./build_librubberband.sh

./build_libtheora.sh

./build_libtwolame.sh

./build_libvidstab.sh

./build_libvmaf.sh

./build_libvpx.sh

./build_libwavpack.sh

./build_libwebp.sh

./build_libxvid.sh

./build_libx264.sh

./build_libx265.sh

./build_libzimg.sh

./build_libzmq.sh

./build_libfdk-aac.sh

./build_libmysofa.sh

./build_libshine.sh

./build_libvo-amrwbenc.sh

./build_libxavs.sh

./build_libzvbi.sh

./build_libavisynth-plus.sh

./build_libiconv.sh

./build_ffmpeg.sh