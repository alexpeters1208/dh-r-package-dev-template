#!/bin/bash

export SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
export DHSRC=$SCRIPT_DIR/src/deephaven

# First, we build all C++ dependencies
cd ./dhcpp
chmod +x ./build-dependencies.sh
./build-dependencies.sh
cd $SCRIPT_DIR

# Next, we build and install the Deephaven C++ client
cd $DHSRC/deephaven-core/cpp-client/deephaven
mkdir build && cd build

export DEEPHAVEN_LOCAL=$SCRIPT_DIR/dhcpp/local
export CMAKE_PREFIX_PATH=${DEEPHAVEN_LOCAL}/abseil:${DEEPHAVEN_LOCAL}/boost:${DEEPHAVEN_LOCAL}/cares:${DEEPHAVEN_LOCAL}/flatbuffers:${DEEPHAVEN_LOCAL}/gflags:${DEEPHAVEN_LOCAL}/immer:${DEEPHAVEN_LOCAL}/protobuf:${DEEPHAVEN_LOCAL}/re2:${DEEPHAVEN_LOCAL}/zlib:${DEEPHAVEN_LOCAL}/grpc:${DEEPHAVEN_LOCAL}/arrow:${DEEPHAVEN_LOCAL}/deephaven
export NCPUS=$(getconf _NPROCESSORS_ONLN)

cmake -DCMAKE_INSTALL_PREFIX=${DEEPHAVEN_LOCAL}/deephaven .. && make -j$NCPUS install

# Finally, we build the examples
cd $DHSRC/deephaven-core/cpp-examples/build-all-examples
mkdir build && cd build
cmake .. && make -j$NCPUS
