#!/usr/bin/env zsh

set -e

source ./env.sh

if [ ! -d ./libshine ]; then
  git clone --depth=1 https://github.com/toots/shine.git libshine
fi

cd ./libshine
./bootstrap
./configure --prefix=/usr/local --disable-shared
make -j ${CPU_NUM} && sudo make install
cd ..