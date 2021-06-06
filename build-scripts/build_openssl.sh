#!/usr/bin/env zsh

set -e

source ./env.sh

ver=1.1.1k

if [ ! -f ./openssl-${ver}.tar.gz ];then
  curl -OL https://www.openssl.org/source/openssl-${ver}.tar.gz
fi

if [ ! -d ./openssl-${ver} ];then
  tar -xzvf ./openssl-${ver}.tar.gz
fi

cd ./openssl-${ver}
# -static is equal to: no-pic, no-shared and no-threads
./Configure --prefix=/opt/local/openssl@1.1 no-ssl3 no-ssl3-method no-zlib no-pic no-shared no-threads \
                darwin64-x86_64-cc enable-ec_nistp_64_gcc_128
make -j ${CPU_NUM} && sudo make install
cd ..