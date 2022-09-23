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
  config/fish
  config/kitty
  config/karabiner/assets/complex_modifications/personal_settings.json
)

for file in ${dotfiles[@]}
do
  echo "ln -nfs \"${dir}/dot/${file}\" \"$HOME/.${file}\""
  ln -nfs "${dir}/dot/${file}" "$HOME/.${file}"
done

# for nvim
echo "ln -nfs \"${dir}/dot/vim\" \"$HOME/.config/nvim\""
ln -nfs "${dir}/dot/vim" "$HOME/.config/nvim"

echo "ln -nfs \"${dir}/dot/vimrc\" \"$HOME/.config/nvim/init.vim\""
ln -nfs "${dir}/dot/vimrc" "$HOME/.config/nvim/init.vim"
