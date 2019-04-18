#!/bin/bash

dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

dotfiles=(
  editorconfig
  vimrc
  vim
  scss-lint.yml
  snippets.json
  tigrc
  tmux.conf
  tmux-powerlinerc
  tmux.d
  tmuxinator
  config/fish
  config/karabiner/assets/complex_modifications/personal_settings.json
)

for file in ${dotfiles[@]}
do
  echo "ln -nfs \"${dir}/dot/${file}\" \"$HOME/.${file}\""
  ln -nfs "${dir}/dot/${file}" "$HOME/.${file}"
done