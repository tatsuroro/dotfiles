#!/bin/sh

# get xcode from appStore
# install cmd line tool on terminal

xcode-select —install

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew doctor

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

brew bundle ~/dotfiles/Brewfile
