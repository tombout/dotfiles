#!/usr/bin/env bash

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
default_target_file="$HOME/.bashrc"

target_file=${1:-$default_target_file}

bashrc_append=$(cat << EOFVIMRC
# Do not edit under this line
test -f ${script_dir}/bashrc && source ${script_dir}/bashrc

EOFVIMRC
)

if [ ! -f "${target_file}" ] || ! grep -Fqx "${bashrc_append}" "${target_file}";
then
    echo "Installing bash dotfiles ..."
    echo "${bashrc_append}" >> "${target_file}"
    echo "Appended following to ${target_file}:"
    echo "${bashrc_append}"
else
    echo "Bash dotfiles already installed. Nothing to do."
fi
