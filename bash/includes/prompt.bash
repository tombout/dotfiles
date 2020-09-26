############################################################
# Colors {{{
############################################################
BLACK="\[\033[0;30m\]"
RED="\[\033[0;31m\]"
GREEN="\[\033[0;32m\]"
YELLOW="\[\033[0;33m\]"
BLUE="\[\033[0;34m\]"
MAGENTA="\[\033[0;35m\]"
CYAN="\[\033[0;36m\]"
WHITE="\[\033[0;37m\]"

EMBLACK="\[\033[1;30m\]"
EMRED="\[\033[1;31m\]"
EMGREEN="\[\033[1;32m\]"
EMYELLOW="\[\033[1;33m\]"
EMBLUE="\[\033[1;34m\]"
EMMAGENTA="\[\033[1;35m\]"
EMCYAN="\[\033[1;36m\]"
EMWHITE="\[\033[1;37m\]"

BGBLACK="\[\033[40m\]"
BGRED="\[\033[41m\]"
BGGREEN="\[\033[42m\]"
BGYELLOW="\[\033[43m\]"
BGBLUE="\[\033[44m\]"
BGMAGENTA="\[\033[45m\]"
BGCYAN="\[\033[46m\]"
BGWHITE="\[\033[47m\]"

RESET="\[\033[0m\]"
# }}}

############################################################
# Functions {{{
############################################################
# get current branch in git repo
function parse_git_branch() {
	BRANCH=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
	if [ ! "${BRANCH}" == "" ]
	then
		STAT=$(parse_git_dirty)
		echo "[${BRANCH}${STAT}]"
	else
		echo ""
	fi
}

# get current status of git repo
function parse_git_dirty {
	status=$(git status 2>&1 | tee)
	dirty=$(echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?")
	untracked=$(echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?")
	ahead=$(echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?")
	newfile=$(echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?")
	renamed=$(echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?")
	deleted=$(echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?")
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}
# }}}

############################################################
# Terminal title
############################################################
# If this is an xterm set the title to user@host:dir
case $TERM in
    xterm*)
        termtitle='\[\033]0;\u@\h:\w\007\]'
        ;;
    *)
        termtitle=''
        ;;
esac

############################################################
# Prompt
############################################################
PS1="${GREEN}"                  # color change
PS1="$PS1["                     # [
PS1="$PS1\u"                    # username
PS1="$PS1@"                     # @
PS1="$PS1\h"                   # host
PS1="$PS1]"                     # ]
PS1="$PS1${YELLOW}"             # color change
PS1="$PS1["                     # [
PS1="$PS1\w"                    # working directory
PS1="$PS1]"                     # ]
PS1="$PS1${CYAN}"               # color change
PS1="$PS1\`parse_git_branch\`"  # git branch / status
PS1="$PS1${EMMAGENTA}"          # color change
#PS1="$PS1["                     # [
#PS1="$PS1\#"                    # command number
#PS1="$PS1 "                     # space
#PS1="$PS1\!"                    # history number
#PS1="$PS1]"                     # ]
PS1="$PS1${RESET}"              # reset color
PS1="$PS1\n"                    # new line
PS1="$PS1\$"                    # $ for normal user / # for root
PS1="$PS1 "                     # space

export PS1="${termtitle}${PS1}"
