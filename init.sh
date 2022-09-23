#!/bin/bash

set -e

# Install Xcode Command Line Tools
xcode-select --install

echo "+++ update osx defaults"
defaults write -g ApplePressAndHoldEnabled -bool false
defaults write com.apple.finder AppleShowAllFiles TRUE
killall Finder

echo 'First, run ./brew.sh and check README!'
