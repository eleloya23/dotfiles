#!/bin/sh

for name in $DOTFILES/*; do
target="$HOME/.$name"
  if [ -e "$target" ]; then
if [ ! -L "$target" ]; then
warning "WARNING: $target exists but is not a symlink."
    fi
else
if [ "$name" != 'install.sh' ] && [ "$name" != 'README.md' ] && ["$name" != 'vim' ]; then
cout "Creando $target"
      ln -s "$DOTFILES/$name" "$target"
    fi
fi
done

cp -rf $DOTFILES/vim ~/.vim