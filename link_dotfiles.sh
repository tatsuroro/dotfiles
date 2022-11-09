#!/bin/bash

dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

dotfiles=(
  gitignore_global
  editorconfig
  scss-lint.yml
  snippets.json
  tigrc
  config/fish
  config/kitty
  config/karabiner/assets/complex_modifications/personal_settings.json
  config/nvim
  config/vim
)

for file in ${dotfiles[@]}
do
  echo "ln -nfs \"${dir}/dot/${file}\" \"$HOME/.${file}\""
  ln -nfs "${dir}/dot/${file}" "$HOME/.${file}"
done

# for vim
echo "ln -nfs \"${dir}/dot/config/vim/vimrc\" \"$HOME/.vimrc\""
ln -nfs "${dir}/dot/config/vim/vimrc" "$HOME/.vimrc"
