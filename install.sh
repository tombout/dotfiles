#!/usr/bin/env bash

set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd -P)"
source ${DOTFILES_DIR}/utilities.sh

append_to_file ${DOTFILES_DIR}/vim/source.template ~/.vimrc
append_to_file ${DOTFILES_DIR}/bash/source.template ~/.bashrc
