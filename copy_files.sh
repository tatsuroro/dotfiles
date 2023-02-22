#!/bin/bash

dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cloud="Dropbox"
devDir="$HOME/${cloud}/dev"

for dirname in .config/karabiner/assets/complex_modifications .git_template/hooks .git/hooks .local/share src bin pkg
do
  echo "mkdir -p \"$HOME/${dirname}\""
  mkdir -p "$HOME/${dirname}"
  chmod 755 "$HOME/${dirname}"
done

echo "+++ copy global gitconfig"
echo "cp -f \"${dir}/dot/git/config\" \"$HOME/.gitconfig\""
cp -f "${dir}/dot/git/config" "$HOME/.gitconfig"

echo "+++ copy global git hooks"
echo "cp -f \"${dir}/dot/git/hooks/*\" \"$HOME/.git/hooks\""
cp -f "${dir}/dot/git/hooks/*" "$HOME/.git/hooks"
chmod 755 "$HOME/.git/hooks/*"
echo "[WARN] You should rename pre-commit hooks config (UserName & Email) !!!"

echo "+++ copy ssh key & configs"
echo "cp -r \"${devDir}/ssh\" \"$HOME/.ssh\""
cp -r "${devDir}/ssh" "$HOME/.ssh"
