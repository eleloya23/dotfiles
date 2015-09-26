#!/usr/bin/env bash
DOTFILES="$PWD/dotfiles/"
APPS="$PWD/apps/"

GREEN="\033[01;32m"
YELLOW="\033[0;33m"
PINK="\033[01;35m"
NOCOLOR="\033[00m"

info() {
  printf "$GREEN-----> $NOCOLOR %b\n" "$1"
}

important() {
  printf "$PINK-----> %b$NOCOLOR\n" "$1"
}

function installcask() {
info "${@}"
brew cask install "${@}" 2> /dev/null
}

function installbrew() {
info "${@}"
brew install "${@}" 2> /dev/null
}

section(){
   printf "\n"
   printf "$PINK------------------------------------------------$NOCOLOR\n"
   printf "$1"
   printf "$PINK------------------------------------------------$NOCOLOR\n"
}

important "Please write sudo password"

sudo -v

#-----------------------------------------------
section "DOTFILES"

   info  "Copying dotfiles"
   source $DOTFILES/install.sh

#-----------------------------------------------


#-----------------------------------------------
section "COMMAND LINE TOOLS & APPS"
   info "Installing homebrew"
   if ! which brew &>/dev/null; then
       ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
       brew update

     if ! grep -qs "recommended by brew doctor" ~/.bash_profile; then
       echo " " >> ~/.bash_profile
       echo "# recommended by brew doctor" >> ~/.bash_profile
       echo "export PATH=\"/usr/local/bin:\$PATH\"" >> ~/.bash_profile
       export PATH="/usr/local/bin:$PATH"
     fi
   else
     important "Homebrew already installed. Skipping ..."
   fi

   info "Installing homebrew-cask"
   brew install caskroom/cask/brew-cask 2>/dev/null

   info "Installing Command Line Tools"
   while read -r line; do installbrew $line; done < $APPS/cli


   info "Installing OS X Apps"
   while read -r line; do installcask $line; done < $APPS/gui

#-----------------------------------------------

#-----------------------------------------------
section "MAC OS X CONFIGURATION"
   source ./osxconfig

#-----------------------------------------------


important "YOUR MAC IS READY"
