#!/usr/bin/env bash

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
default_target_file="$HOME/.vimrc"

target_file=${1:-$default_target_file}

vimrc_append=$(cat << EOFVIMRC
" Do not edit under this line
source ${script_dir}/vimrc

EOFVIMRC
)

if [ ! -f "${target_file}" ] || ! grep -Fqx "${vimrc_append}" "${target_file}";
then
    echo "Installing vim dotfiles ..."
    echo "${vimrc_append}" >> "${target_file}"
    echo "Appended following to ${target_file}:"
    echo "${vimrc_append}"
else
    echo "Vim dotfiles already installed. Nothing to do."
fi
