#!/usr/bin/env bash

DEFAULTS="$PWD/defaults/"
DOTFILES="$PWD/resources/dotfiles/"
RESOURCES="$PWD/resources/"
source $DEFAULTS/functions.sh

cout "Escribe el password actual de administrador"
sudo -v

#-----------------------------------------------
section "BASH & VIM"

   cout  "Instalando .bash files"
   cout  "Instalando .vim files"
   source $DOTFILES/install.sh
   
   cp $RESOURCES/wallpaper.jpg ~/Pictures/wallpaper.jpg
   
#-----------------------------------------------


#-----------------------------------------------
section "GITHUB CONFIG"
   cout "Generando ssh keys (se copiara al clipboard)"
   [ ! -f ~/.ssh/id_rsa ] && ssh-keygen -t rsa -N '' -f ~/.ssh/id_rsa > /dev/null && pbcopy < ~/.ssh/id_rsa.pub
 
   cout "Abriendo github para que agregar la ssh pub key... esperaremos"
   open https://github.com/settings/ssh

   read -sn 1 -p "Presiona cualquier tecla para continuar..."

   cout "Setup Github"
   GITHUB_USER_SET=$(git config -f ~/.gitconfig.private github.user)
   [[ -z $GITHUB_USER_SET && -z $GITHUB_USER ]] && echo 'Escribe tu github username:' && read GITHUB_USER
   [[ $GITHUB_USER_SET != $GITHUB_USER ]] && git config -f ~/.gitconfig.private github.user $GITHUB_USER > /dev/null
   [[ -z $GITHUB_USER ]] && GITHUB_USER=$GITHUB_USER_SET
 
   GIT_EMAIL_SET=$(git config -f ~/.gitconfig.private user.email)
   [[ -z $GIT_EMAIL_SET && -z $GIT_EMAIL ]] && echo 'Escribe tu correo de github:' && read GIT_EMAIL
   [[ $GIT_EMAIL_SET != $GIT_EMAIL ]] && git config -f ~/.gitconfig.private user.email $GIT_EMAIL > /dev/null

 
   GIT_NAME_SET=$(git config -f ~/.gitconfig.private user.name)
   [[ -z $GIT_NAME_SET && -z $GIT_NAME ]] && echo 'Escribe tu nombre para git:' && read GIT_NAME
   [[ $GIT_NAME_SET != $GIT_NAME ]] && git config -f ~/.gitconfig.private user.name $GIT_NAME > /dev/null
#-----------------------------------------------

#-----------------------------------------------
section "HOMEBREW TOLLS & APPS"
   cout "Instalando homebrew"
   if ! which brew &>/dev/null; then
       ruby <(curl -fsS https://raw.github.com/Homebrew/homebrew/go/install)
       brew update

     if ! grep -qs "recommended by brew doctor" ~/.bash_profile; then
       echo "Put Homebrew location earlier in PATH ..."
         echo "\n# recommended by brew doctor" >> ~/.bash_profile
         echo "export PATH=\"/usr/local/bin:\$PATH\"\n" >> ~/.bash_profile
         export PATH="/usr/local/bin:$PATH"
     fi
   else
     warning "Homebrew already installed. Skipping ..."
   fi

   cout "Instalando homebrew-cask"
   brew tap phinze/homebrew-cask 2>/dev/null
   brew install brew-cask 2>/dev/null
  
   cout "Instalando Command Line Tools"
   while read -r line; do installbrew $line; done < ./defaults/brew.tools

   cout "Instalando OS X Apps"
   while read -r line; do installcask $line; done < ./defaults/brew.apps
   
   cout "Configurando Tools & Apps"
   source brew.post
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
