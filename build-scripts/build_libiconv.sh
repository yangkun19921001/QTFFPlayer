#!/usr/bin/env zsh

set -e

source ./env.sh

ver=1.16

if [ ! -f ./libiconv-${ver}.tar.gz ];then
  curl -OL https://ftp.gnu.org/gnu/libiconv/libiconv-${ver}.tar.gz
fi

if [ ! -d ./libiconv-${ver} ];then
  tar -xzvf ./libiconv-${ver}.tar.gz
fi

cd ./libiconv-${ver}
./configure --prefix=/usr/local --disable-debug --disable-dependency-tracking \
            --enable-extra-encodings --enable-static --disable-shared
make -f ./Makefile.devel -j ${NUM} && make install
cd ..

cat <<EOF > /usr/local/lib/pkgconfig/iconv.pc
prefix=/usr/local
libdir=\${prefix}/lib
includedir=\${prefix}/include

Name: libiconv
Description: Conversion library
Version: ${ver}
Libs: -L\${libdir} -liconv
Libs.private:
Cflags: -I\${includedir}
EOF