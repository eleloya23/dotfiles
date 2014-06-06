#!/usr/bin/env bash

DEFAULTS="$PWD/defaults/"
DOTFILES="$PWD/dotfiles/"
RESOURCES="$PWD/resources/"

GREEN="\033[01;32m"
YELLOW="\033[0;33m"
PINK="\033[01;35m"
NOCOLOR="\033[00m"

info() {
  printf "$GREEN-----> $NOCOLOR %b\n" "$1"
}

success() {
  printf "$GREEN-----> $YELLOW %b$NOCOLOR\n" "$1"
}

warning() {
  printf "$PINK-----> %b$NOCOLOR\n" "$1"
}

function installcask() {
cool "${@}"
brew cask install "${@}" 2> /dev/null
}

function installbrew() {
cool "${@}"
brew install "${@}" 2> /dev/null
}

section(){
   printf "\n"
   printf "$PINK------------------------------------------------$NOCOLOR\n"
   printf "$1"
   printf "$PINK------------------------------------------------$NOCOLOR\n"
}

info "Escribe el password para sudo"
sudo -v

#-----------------------------------------------
section "Instalando DOTFILES"

   info  "Instalando .bash_profile"
   info  "Instalando .vim files"
   source $DOTFILES/install.sh

#-----------------------------------------------


#-----------------------------------------------
section "HOMEBREW TOLLS & APPS"
   cout "Instalando homebrew"
   if ! which brew &>/dev/null; then
       ruby <(curl -fsS https://raw.github.com/Homebrew/homebrew/go/install)
       brew update

     if ! grep -qs "recommended by brew doctor" ~/.bash_profile; then
       echo "Put Homebrew location earlier in PATH ..."
       echo " " >> ~/.bash_profile
         echo "# recommended by brew doctor" >> ~/.bash_profile
         echo "export PATH=\"/usr/local/bin:\$PATH\"\n" >> ~/.bash_profile
         export PATH="/usr/local/bin:$PATH"
     fi
   else
     warning "Homebrew already installed. Skipping ..."
   fi

   cout "Instalando homebrew-cask"
   brew tap phinze/homebrew-cask 2>/dev/null
   brew install brew-cask 2>/dev/null

   section "COMMAND LINE TOOLS"
   cout "Instalando Command Line Tools"
   while read -r line; do installbrew $line; done < ./defaults/brew.tools


   section "MAC OS X APPS"
   cout "Instalando OS X Apps"
   while read -r line; do installcask $line; done < ./defaults/brew.apps


   cout "Configurando Tools & Apps"
   source $DEFAULTS/brew.post


#-----------------------------------------------

#-----------------------------------------------
section "MAC OS X CONFIG"
   source $DEFAULTS/osxconfig

#-----------------------------------------------


#-----------------------------------------------
section "RVM & RUBY"
   curl -L https://get.rvm.io | bash -s stable --rails --autolibs=enable
   echo '[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function' >> ~/.bash_profile
   source ~/.bash_profile

   while read -r line; do rvm install $line; done < ./defaults/rubies

#-----------------------------------------------

section "LISTO"
