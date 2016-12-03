# .bash_profile is executed by login shells
# .bashrc is executed for interactive non-login

# Don't know which one to use? No matter, just put everything on .bashrc
# and reference it here in case this one is executed.

if [ -f $HOME/.bashrc ]; then
	source $HOME/.bashrc
fi
