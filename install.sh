#!/usr/bin/env bash

set -e

dotfiles_dir="$(cd "$(dirname "$0")" && pwd -P)"

source ${dotfiles_dir}/vim/install.sh
source ${dotfiles_dir}/bash/install.sh
