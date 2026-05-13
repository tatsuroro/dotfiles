#!/bin/sh
set -e
echo "==> Installing Homebrew and packages"

if ! brew --version &>/dev/null; then
  echo "    Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew install mas
brew install rcmdnk/file/brew-file
brew file install -f "$HOME/.Brewfile"

echo "    Done."
