#!/bin/bash

dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

dotfiles=(
  gitignore_global
  editorconfig
  vimrc
  vim
  scss-lint.yml
  snippets.json
  tigrc
  tmux.conf
  tmux-powerlinerc
  tmux.d
  config/direnv/direnvrc
  config/fish
  config/karabiner/assets/complex_modifications/personal_settings.json
)

for file in ${dotfiles[@]}
do
  echo "ln -nfs \"${dir}/dot/${file}\" \"$HOME/.${file}\""
  ln -nfs "${dir}/dot/${file}" "$HOME/.${file}"
done
