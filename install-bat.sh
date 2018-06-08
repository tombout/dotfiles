#!/usr/bin/env bash

set -e

dotfiles_dir="$(cd "$(dirname "$0")" && pwd -P)"

mkdir -p libs/test

if [ ! -f  "libs/test/bats/bin/bats" ]; then
    git clone -b 'v0.4.0' --single-branch --depth 1 https://github.com/sstephenson/bats libs/test/bats
    echo "Bats installed to ${dotfiles_dir}/libs/test/bats."
fi

if [ "$(command -v bats 2>&1)" != "${dotfiles_dir}/libs/test/bats/libexec/bats" ]; then
    cat << EOFBATSPATH >> ~/.bashrc
export PATH=${dotfiles_dir}/libs/test/bats/libexec:\$PATH
EOFBATSPATH
    echo "Added Bats to PATH in ~/.bashrc"
else
    echo "Bats is already installed."
fi

if [ ! -f  "libs/test/bats-support/load.bash" ]; then
    git clone -b 'v0.3.0' --single-branch --depth 1 https://github.com/ztombol/bats-support \
        libs/test/bats-support
    echo "Bats-support installed to ${dotfiles_dir}/libs/test/bats-support."
fi

if [ ! -f  "libs/test/bats-assert/load.bash" ]; then
    git clone -b 'v0.3.0' --single-branch --depth 1 https://github.com/ztombol/bats-assert \
        libs/test/bats-assert
    echo "Bats-assert installed to ${dotfiles_dir}/libs/test/bats-assert."
fi
