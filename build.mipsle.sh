#!/usr/bin/env bash
rm -rf build
mkdir -p build
pushd build
cmake -GNinja -DCMAKE_TOOLCHAIN_FILE=../toolchain.mipsle.cmake CMAKE_BUILD_TYPE=Release .. 
ninja
popd

