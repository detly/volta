#!/bin/bash

set -e

echo "Building Volta"

if [[ "$1" == *"apple-darwin"* ]]; then
    SDKROOT=$(xcrun -sdk macosx11.1 --show-sdk-path) MACOSX_DEPLOYMENT_TARGET=11.0 cargo build --release --target=$1
else
    cargo build --release --target $1
fi

echo "Packaging Binaries"

cd target/$1/release
tar -zcvf "$1.tar.gz" volta volta-shim volta-migrate
