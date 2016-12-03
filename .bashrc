###########################
#  History Configuration  #
###########################

# Keep de History small to reduce attack surface
export HISTSIZE=50
export HISTCONTROL=ignoreboth
shopt -s histappend

###########################
#  General Configuration  #
###########################

export EDITOR="vim"
export LC_ALL="en_US.UTF-8"

# Add custom scripts to path. But at the end!
# This is for security reasons. Avoids a binary evil twin.
if [ -d ~/bin ] ; then
	PATH="${PATH}":~/bin
fi

[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)" # Makes LESS smarter. See lesspipe(1)

############
#  PROMPT  #
############

YELLOW="\[\033[0;33m\]"
COLOR1="\[\033[01;32m\]" #green
PINK="\[\033[01;35m\]" #pink
COLOR2="\[\033[01;34m\]" #blue
NOCOLOR="\[\033[00m\]"


export PS1="$PINK\u$COLOR1@\h$COLOR2 \w$YELLOW \$(parse_git_branch) $NOCOLOR "
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

################################
#  IMPORT ALIASES & FUNCTIONS  #
################################
source ~/.bash_env
source ~/.bash_functions
source ~/.bash_aliases
