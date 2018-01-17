SET(CMAKE_SYSTEM_NAME Linux)

# specify the cross compiler
SET(CMAKE_C_COMPILER   /data/dp/r3ptoolchain/toolchain/bin/mipsel-xiaomi-linux-uclibc-gcc)
SET(CMAKE_CXX_COMPILER /data/dp/r3ptoolchain/toolchain/bin/mipsel-xiaomi-linux-uclibc-g++)
# where is the target environment 
SET(CMAKE_FIND_ROOT_PATH /data/dp/r3ptoolchain)
# search for programs in the build host directories
SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
# for libraries and headers in the target directories
SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

