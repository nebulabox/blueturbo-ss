cmake_minimum_required(VERSION 3.6)
project(blueturbo-ss)

set (CMAKE_C_STANDARD 99)
set (CMAKE_CXX_STANDARD 11)
set (CMAKE_MACOSX_RPATH TRUE)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_SOURCE_DIR}/cmake)

set (BUILD_TYPE ${CMAKE_BUILD_TYPE})
if (NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Debug)
    set(BUILD_TYPE Debug)
endif ()

# Detect linux
if (UNIX AND NOT APPLE)
    set(LINUX TRUE)
endif ()

message(STATUS "Running cmake version ${CMAKE_VERSION}")

include_directories(libcork/include)
include_directories(libipset/include)
include_directories(libbloom/murmur2)
include_directories(libbloom)
include_directories(libev)
include_directories(mbedtls/include)
include_directories(c-ares)
include_directories(${CMAKE_BINARY_DIR}/libsodium/src/libsodium/include)
include_directories(libsodium/src/libsodium/include)
include_directories(libsodium/src/libsodium/include/sodium)
include_directories(${CMAKE_BINARY_DIR}/c-ares)

add_compile_options( -w  )

add_subdirectory(libsodium)
add_subdirectory(libev)
add_subdirectory(mbedtls)
add_subdirectory(c-ares)

set(CMAKE_BUILD_TYPE ${BUILD_TYPE})

set(PROJECT_VERSION "10.1.0")
set(PROJECT_NAME blueturbo-ss)
set(VERSION ${PACKAGE_VERSION})
# Run platform tests
include(${CMAKE_SOURCE_DIR}/cmake/configure.cmake)
configure_file(${CMAKE_SOURCE_DIR}/cmake/config.h.cmake ${CMAKE_BINARY_DIR}/src/config.h)
add_definitions(-DHAVE_CONFIG_H)
include_directories(${CMAKE_BINARY_DIR}/src)

set(LIBCORK_SOURCE
        libcork/src/libcork/cli/commands.c
        libcork/src/libcork/core/allocator.c
        libcork/src/libcork/core/error.c
        libcork/src/libcork/core/gc.c
        libcork/src/libcork/core/hash.c
        libcork/src/libcork/core/ip-address.c
        libcork/src/libcork/core/mempool.c
        libcork/src/libcork/core/timestamp.c
        libcork/src/libcork/core/u128.c
        libcork/src/libcork/core/version.c
        libcork/src/libcork/ds/array.c
        libcork/src/libcork/ds/bitset.c
        libcork/src/libcork/ds/buffer.c
        libcork/src/libcork/ds/dllist.c
        libcork/src/libcork/ds/file-stream.c
        libcork/src/libcork/ds/hash-table.c
        libcork/src/libcork/ds/managed-buffer.c
        libcork/src/libcork/ds/ring-buffer.c
        libcork/src/libcork/ds/slice.c
        libcork/src/libcork/posix/directory-walker.c
        libcork/src/libcork/posix/env.c
        libcork/src/libcork/posix/exec.c
        libcork/src/libcork/posix/files.c
        libcork/src/libcork/posix/process.c
        libcork/src/libcork/posix/subprocess.c
        libcork/src/libcork/pthreads/thread.c
        )
add_library(cork STATIC ${LIBCORK_SOURCE})
target_compile_definitions(cork PUBLIC -DCORK_API=CORK_LOCAL)

set(LIBIPSET_SOURCE
        libipset/src/libipset/general.c
        libipset/src/libipset/bdd/assignments.c
        libipset/src/libipset/bdd/basics.c
        libipset/src/libipset/bdd/bdd-iterator.c
        libipset/src/libipset/bdd/expanded.c
        libipset/src/libipset/bdd/reachable.c
        libipset/src/libipset/bdd/read.c
        libipset/src/libipset/bdd/write.c
        libipset/src/libipset/map/allocation.c
        libipset/src/libipset/map/inspection.c
        libipset/src/libipset/map/ipv4_map.c
        libipset/src/libipset/map/ipv6_map.c
        libipset/src/libipset/map/storage.c
        libipset/src/libipset/set/allocation.c
        libipset/src/libipset/set/inspection.c
        libipset/src/libipset/set/ipv4_set.c
        libipset/src/libipset/set/ipv6_set.c
        libipset/src/libipset/set/iterator.c
        libipset/src/libipset/set/storage.c
        )
add_library(ipset STATIC ${LIBIPSET_SOURCE})

set(LIBBLOOM_SOURCE
        libbloom/bloom.c
        libbloom/murmur2/MurmurHash2.c
        )
add_library(bloom STATIC ${LIBBLOOM_SOURCE})
target_link_libraries(ipset cork bloom)

add_subdirectory(src)


