#!/bin/bash
for dirname in .config .git_template/hooks src bin pkg
do
  echo "mkdir -p \"$HOME/.${dirname}\""
  mkdir -p "$HOME/${dirname}"
done

dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

for file in vimrc vim scss-lint.yml snippets.json tigrc tmux.conf tmux-powerlinerc tmux.d tmuxinator config/fish config/nvim
do
  echo "ln -nfs \"${dir}/dot/${file}\" \"$HOME/.${file}\""
  ln -nfs "${dir}/dot/${file}" "$HOME/.${file}"
done

devDir="$HOME/Google\ Drive/dev"

echo "+++ copy ssh key & configs"
touch "$HOME/.ssh"
cp -r "${devDir}/ssh/*" "$HOME/.ssh"

echo "+++ copy dev fonts"
cp -f "${devDir}/fonts/scp-powerline/*.otf" "$HOME/Library/Fonts/"
fc-cache -vf
