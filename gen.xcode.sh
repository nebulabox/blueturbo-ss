#!/usr/bin/env bash
rm -rf build
mkdir -p build
pushd build
cmake -GXcode -DCMAKE_BUILD_TYPE=Debug .. 
popd

