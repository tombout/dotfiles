#@IgnoreInspection BashAddShebang

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

MACHINE="$(uname -s)"

# Remember that this script is sourced from ~/.bashrc
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
INCLUDES="$SCRIPT_DIR/includes"
ALIASES="$SCRIPT_DIR/aliases"

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Start ssh-agent if not already running
[[ -n ${SSH_AGENT_PID} ]] || eval "$(ssh-agent -s)" > /dev/null
# Kill ssh-agent on exit
trap "kill $SSH_AGENT_PID" SIGHUP

[[ -f "$INCLUDES/prompt.bash" ]] && source "$INCLUDES/prompt.bash"
[[ -f "$INCLUDES/history.bash" ]] && source "$INCLUDES/history.bash"

# Source all aliases
[[ -d "$ALIASES" ]] && for f in "$ALIASES"/*; do source "$f"; done