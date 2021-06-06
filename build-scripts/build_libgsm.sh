#!/usr/bin/env zsh

set -e

source ./env.sh

if [ ! -f ./gsm-1.0.19.tar.gz ];then
  curl -OL http://www.quut.com/gsm/gsm-1.0.19.tar.gz
fi

if [ ! -d ./gsm-1.0-pl19 ];then
  tar -xzvf ./gsm-1.0.19.tar.gz
fi

if [ -f ${INSTALL_PREFIX}/lib/libgsm.a ];then
  rm -f ${INSTALL_PREFIX}/lib/libgsm.a
fi

cd ./gsm-1.0-pl19
make CC=clang GSM_INSTALL_ROOT=${INSTALL_PREFIX} GSM_INSTALL_INC=${INSTALL_PREFIX}/include GSM_INSTALL_MAN=${INSTALL_PREFIX}/share/man/man3 -j ${NUM} install
cd ..