#!/bin/sh
#
# Copia los archivos de configuración al folder del usuario
#

DOTFILES="$PWD/dotfiles/"

for name in $DOTFILES/*; do
target="$HOME/.${name##*/}"
  #Solo copia el archivo si no existia antes
  if [ -e "$target" ]; then
    warning "WARNING: $target already exists."
  else
    if [ "${name##*/}" != 'install.sh' ]; then
      info "Copying $target"
      cp -rf $name $target
    fi
  fi
done
