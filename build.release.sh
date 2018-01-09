#!/usr/bin/env bash
CPUCOUNT="`python -c 'import multiprocessing as mp; print(mp.cpu_count())' `"
rm -rf build
mkdir -p build
pushd build
cmake -GNinja -DCMAKE_BUILD_TYPE=Release .. 
ninja
popd

