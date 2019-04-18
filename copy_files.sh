#!/bin/bash

dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cloud="Google\ Drive"
devDir="$HOME/${cloud}/dev"

for dirname in .config/karabiner/assets/complex_modifications .git_template/hooks .local/share src bin pkg
do
  echo "mkdir -p \"$HOME/${dirname}\""
  mkdir -p "$HOME/${dirname}"
  chmod 755 "$HOME/${dirname}"
done

echo "+++ copy gitconfig"
echo "cp -f \"${dir}/dot/gitconfig\" \"$HOME/.gitconfig\""
cp -f "${dir}/dot/gitconfig" "$HOME/.gitconfig"

echo "+++ copy ssh key & configs"
echo "cp -r \"${devDir}/ssh\" \"$HOME/.ssh\""
cp -r "${devDir}/ssh" "$HOME/.ssh"

echo "+++ copy dev fonts"
echo "cp -f \"${devDir}/fonts/scp-powerline/*.otf\" \"$HOME/Library/Fonts/\""
cp -f "${devDir}/fonts/scp-powerline/*.otf" "$HOME/Library/Fonts/"
