
cout() {
  GREEN="\033[01;32m"
  NOCOLOR="\033[00m"  
  printf "$GREEN-----> $NOCOLOR %b\n" "$1"
}

cool() {
  GREEN="\033[01;32m"
  YELLOW="\033[0;33m"
  NOCOLOR="\033[00m"  
  printf "$GREEN-----> $YELLOW %b$NOCOLOR\n" "$1"
}

warning() {
  PINK="\033[01;35m"
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
   PINK="\033[01;35m"
   NOCOLOR="\033[00m"
   printf "\n$PINK------------------------------------------------$NOCOLOR\n"
   printf "$PINK%b$NOCOLOR\n" "$1"
   printf "$PINK------------------------------------------------$NOCOLOR\n"
}