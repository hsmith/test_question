#!/bin/bash

set -e

TESTING=OFF
BUILD_TYPE=RelWithDebInfo
GENERATOR=Ninja
TARGET="all"
RECONFIG=false
BUILD_SHARED=OFF
MAX_THREADS=8
RUN_TESTS=OFF
ENABLE_TESTING=OFF

while [[ $# -gt 0 ]]; do
    case $1 in
        --release)
            TESTING=OFF
            BUILD_TYPE=MinSizeRel
            shift
        ;;
        --debug)
            TESTING=OFF
            BUILD_TYPE=RelWithDebInfo
            shift
        ;;
        --profile)
            TESTING=ON
            BUILD_TYPE=MinSizeRel
            shift
        ;;
        --test)
            TESTING=ON
            BUILD_TYPE=RelWithDebInfo
            RUN_TESTS=ON
            ENABLE_TESTING=ON
            shift
        ;;
        --bench)
            TESITNG=ON
            BUILD_TYPE=MinSizeRel
            shift
        ;;
        --target)
            TARGET=$2
            shift
            shift
        ;;
        -r)
            RECONFIG=true
            shift
        ;;
        --shared)
            BUILD_SHARED=ON
            shift
        ;;
    esac
done

BUILD_DIR=build/linux/
if [ ! -d $BUILD_DIR ]; then
    RECONFIG=true
fi

if [ ! -z "${RECONFIG:+x}" ]; then
    cmake -S. -B$BUILD_DIR -DCMAKE_BUILD_TYPE=$BUILD_TYPE -DBUILD_SHARED_LIBS=$BUILD_SHARED -G$GENERATOR -DENABLE_TESTING=$ENABLE_TESTING $@
fi


cmake --build $BUILD_DIR --target "$TARGET"

if [[ $RUN_TESTS == "ON" ]]; then
    cd $BUILD_DIR && ctest -VV -j$MAX_THREADS
fi
