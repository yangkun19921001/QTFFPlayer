#!/usr/bin/env zsh

set -e

source ./env.sh

ver=0.21

if [ ! -f ./gettext-${ver}.tar.xz ];then
  curl -OL https://ftp.gnu.org/gnu/gettext/gettext-${ver}.tar.xz
fi

if [ ! -d ./gettext-${ver} ];then
  tar -xzvf ./gettext-${ver}.tar.xz
fi

cd ./gettext-${ver}/gettext-runtime
CFLAGS="-I/usr/local/include" \
./configure --prefix=/usr/local --disable-dependency-tracking \
            --disable-java --disable-csharp \
            --enable-static --disable-shared
make -j ${CPU_NUM} && sudo make install
cd ../..

cat <<EOF > /usr/local/lib/pkgconfig/intl.pc
prefix=/usr/local
libdir=\${prefix}/lib
includedir=\${prefix}/include

Name: libintl
Description: gettext runtime
Version: ${ver}
Libs: -L\${libdir} -lintl
Libs.private:
Cflags: -I\${includedir}
EOF