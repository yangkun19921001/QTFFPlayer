#!/usr/bin/env zsh

set -e

source ./env.sh

if [ ! -d ./libavisynth-plus ]; then
  git clone --depth=1 -b v3.7.0 https://github.com/AviSynth/AviSynthPlus.git libavisynth-plus
fi

cd ./libavisynth-plus
mkdir -p ./avisynth-build && cd ./avisynth-build
cmake ../ -DHEADERS_ONLY:bool=on
make -j ${CPU_NUM} install
cd ../..