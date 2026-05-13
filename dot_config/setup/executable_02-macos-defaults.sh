#!/bin/sh
set -e
echo "==> Configuring macOS defaults"

defaults write -g ApplePressAndHoldEnabled -bool false
defaults write com.apple.finder AppleShowAllFiles TRUE
killall Finder

echo "    Done."
