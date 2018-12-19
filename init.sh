#!/bin/bash

set -e

# Install Xcode Command Line Tools
xcode-select --install

echo "+++ update osx defaults"
defaults write -g ApplePressAndHoldEnabled -bool false
defaults write com.apple.finder AppleShowAllFiles TRUE
killall Finder

echo "+++ add git util to PATH"
ln -s /usr/local/share/git-core/contrib/diff-highlight/diff-highlight /usr/local/bin

echo '+++ after setup rbenv, exec `gem install tmuxinator`'

echo 'first, brew install, then, exec sync.sh and shell.sh'
