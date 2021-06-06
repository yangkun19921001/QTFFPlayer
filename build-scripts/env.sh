#!/usr/bin/env zsh

set -e

export FFMPEG_VERSION=4.4

MIN_TARGET=10.9

export CC=/opt/local/bin/clang \
       CXX=/opt/local/bin/clang++ \
       AR_FLAGS='cru'

export sysroot=`xcrun --sdk macosx --show-sdk-path`

export SDKROOT="${sysroot}"
export MACOSX_DEPLOYMENT_TARGET=${MIN_TARGET}

export CMAKE_OSX_SYSROOT="${SDKROOT}"
export CMAKE_OSX_DEPLOYMENT_TARGET="${MACOSX_DEPLOYMENT_TARGET}"

export CPU_NUM=$(sysctl -n hw.logicalcpu_max)
export INSTALL_PREFIX=/usr/local

export PKG_CONFIG_PATH=/opt/local/openssl@1.1/lib/pkgconfig:/usr/local/lib/pkgconfig:/usr/local/share/pkgconfig