#@IgnoreInspection BashAddShebang

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

machine="$(uname -s)"

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Start ssh-agent if not already running
[[ -n ${SSH_AGENT_PID} ]] || eval "$(ssh-agent -s)" > /dev/null
# Kill ssh-agent on exit
trap "kill $SSH_AGENT_PID" SIGHUP

# Remember that this script is sourced from ~/.bashrc
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
includes="$script_dir/includes"
aliases="$script_dir/aliases"

[[ -f "$includes/prompt.bash" ]] && source "$includes/prompt.bash"
[[ -f "$includes/history.bash" ]] && source "$includes/history.bash"

# Source all aliases
[[ -d "$aliases" ]] && for f in "$aliases"/*; do source "$f"; done
