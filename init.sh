#!/bin/bash

set -e

# Install Xcode Command Line Tools
xcode-select --install

# Install Homebrew & Homebrew-file
curl -fsSL https://raw.github.com/rcmdnk/homebrew-file/install/install.sh | sh

brew update
brew install caskroom/cask/brew-cask
brew install mas
brew install rcmdnk/file/brew-file

brew file install

source "sync.sh"

source "shell.sh"

echo "+++ update osx defaults"
defaults write com.apple.finder AppleShowAllFiles TRUE
killall Finder

echo "+++ add git util to PATH"
ln -s /usr/local/share/git-core/contrib/diff-highlight/diff-highlight /usr/local/bin

echo 'after setup ruby, exec `gem install tmuxinator`'
