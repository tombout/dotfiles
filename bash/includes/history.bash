# https://www.gnu.org/software/bash/manual/bash.html#index-HISTCONTROL
HISTCONTROL=erasedups

# https://www.gnu.org/software/bash/manual/bash.html#index-HISTSIZE
HISTSIZE=1000

# https://www.gnu.org/software/bash/manual/bash.html#index-HISTFILESIZE
HISTFILESIZE=2000

# https://www.gnu.org/software/bash/manual/bash.html#index-HISTTIMEFORMAT
HISTTIMEFORMAT="%d/%m/%y %T "

# https://www.gnu.org/software/bash/manual/bash.html#index-HISTIGNORE
HISTIGNORE="ls:pwd:ll:cd"

# https://www.gnu.org/software/bash/manual/bash.html#The-Shopt-Builtin-1
shopt -s histappend
