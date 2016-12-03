###################
#  Dir Bookmarks  #
###################
alias estela="cd ~/Action/ecs-meta/estela/"

####################
#  File Bookmarks  #
####################
alias aliases="vim ~/.bash_aliases"
alias bashes="vim ~/.bashrc"

#################
#  Handy Alias  #
#################
alias ls="ls --color=auto"
alias ll="ls -lF --color=auto"
alias la="ls -laF --color=auto"
alias ..="cd .."
alias psaux="ps aux | less"
alias randommac="openssl rand -hex 6 2>/dev/null | sed 's/\(..\)/\1:/g; s/.$//'"
alias randompass="< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c${1:-32};echo;" #Outputs the top usable 32 chars from /dev/urandom

#################
#   git stuff   #
#################
alias st="git status"
alias lg="git log"
alias commit="git commit -m"
alias add="git add -A ."


#######################
# UBUNTU ONLY ALIASES #
#######################

# Append to long running commands. Sends a notification upon finishing.
# Example: sleep 10;alert
# Only for Ubuntu 
[ -x /usr/bin/notify-send ] && alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1| cut -c8-)"'
[ -x /usr/bin/gnome-screensaver-command ] && alias lock="gnome-screensaver-command -l"


#####################
# OS X ONLY ALIASES #
#####################
[ -d /System ] && alias lock="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"