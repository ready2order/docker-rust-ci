#! /bin/bash

# Script to run inside to container for building the image.

case $TOOLCHAIN in
    stable)
        ;;
    beta)
        ;;
    nightly)
        ;;
    *)
        echo "Invalid toolchain. Expected stable/beta/nightly"
        exit 1
        ;;
esac


cd /root

apt-get update &&
apt-get install -y curl build-essential &&
curl https://sh.rustup.rs -sSf | sh -s -- -y --default-toolchain $TOOLCHAIN &&
source ./.profile &&
rustup run nightly cargo install rustfmt-nightly &&
rustup run nightly cargo install clippy
