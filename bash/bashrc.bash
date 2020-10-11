#@IgnoreInspection BashAddShebang

# Use same language on all systems
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# If not running interactively, don't do anything
# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes
if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
   PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
   PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
   PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
   ;;
*)
   ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
   test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
   alias ls='ls --color=auto'
   #alias dir='dir --color=auto'
   #alias vdir='vdir --color=auto'

   alias grep='grep --color=auto'
   alias fgrep='fgrep --color=auto'
   alias egrep='egrep --color=auto'
fi

# Use vim as default editor
export EDITOR=vim

machine="$(uname -s)"

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Remember that this script is sourced from ~/.bashrc
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
includes="$script_dir/includes"
aliases="$script_dir/aliases"

#[[ -f "$includes/ssh-agent.bash" ]] && source "$includes/ssh-agent.bash"
#[[ -f "$includes/prompt.bash" ]] && source "$includes/prompt.bash"
#[[ -f "$includes/history.bash" ]] && source "$includes/history.bash"

[[ -d "$includes" ]] && for f in "$includes"/*; do source "$f"; done

# Source all aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

[[ -d "$aliases" ]] && for f in "$aliases"/*; do source "$f"; done
