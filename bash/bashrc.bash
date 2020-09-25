#@IgnoreInspection BashAddShebang

# Use same language on all systems
export LANG=en_US.uft8

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Use vim as default editor
export EDITOR=vim

machine="$(uname -s)"

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Remember that this script is sourced from ~/.bashrc
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
includes="$script_dir/includes"
aliases="$script_dir/aliases"

[[ -f "$includes/ssh-agent.bash" ]] && source "$includes/ssh-agent.bash"
[[ -f "$includes/prompt.bash" ]] && source "$includes/prompt.bash"
[[ -f "$includes/history.bash" ]] && source "$includes/history.bash"

# Source all aliases
[[ -d "$aliases" ]] && for f in "$aliases"/*; do source "$f"; done
