#!/bin/bash

export PREFIX=$HOME/devroot

export SCRIPT_DIR=`dirname $0`;
export CMAKE_PREFIX_PATH=$PREFIX:$CMAKE_PREFIX_PATH
export PKG_CONFIG_PATH=$PREFIX/lib/pkgconfig/:$PKG_CONFIG_PATH
cmake \
    -G "Eclipse CDT4 - Unix Makefiles" \
    -DCMAKE_CXX_FLAGS="-std=c++11" \
    -DCMAKE_INSTALL_PREFIX=$PREFIX \
    -DCMAKE_PREFIX_PATH="$CMAKE_PREFIX_PATH" \
    -DCMAKE_BUILD_TYPE=Debug \
    -DCMAKE_ECLIPSE_MAKE_ARGUMENTS="-j6" \
    $SCRIPT_DIR

