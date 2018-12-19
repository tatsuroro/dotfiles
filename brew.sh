#!/bin/bash

# Install Homebrew & Homebrew-file
curl -fsSL https://raw.github.com/rcmdnk/homebrew-file/install/install.sh | sh

brew update
brew tap caskroom/cask
brew install mas
brew install rcmdnk/file/brew-file

brew file install -f "$HOME/dotfiles/Brewfile"
