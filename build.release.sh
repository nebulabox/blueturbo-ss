#!/usr/bin/env bash
rm -rf build
mkdir -p build
pushd build
cmake -GNinja CMAKE_BUILD_TYPE=Release .. 
ninja
popd

