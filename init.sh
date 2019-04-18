#!/bin/bash

set -e

# Install Xcode Command Line Tools
xcode-select --install

echo "+++ update osx defaults"
defaults write -g ApplePressAndHoldEnabled -bool false
defaults write com.apple.finder AppleShowAllFiles TRUE
killall Finder

echo '+++ Notice: after setup rbenv, exec `gem install tmuxinator` if you need'
echo 'First, run ./brew.sh and check README!'
