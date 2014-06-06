#!/bin/sh

for name in $DOTFILES/*; do
target="$HOME/.${name##*/}"
  if [ -e "$target" ]; then
if [ ! -L "$target" ]; then
warning "WARNING: $target exists but is not a symlink."
    fi
else
if [ "${name##*/}" != 'install.sh' ]; then
cout "Creando $target"
      cp -rf $name $target
    fi
fi
done
