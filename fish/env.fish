set -gx LANG ja_JP.UTF-8
set -gx EDITOR vim
set -gx SHELL /usr/local/bin/fish

set -gx PATH /usr/local/bin /usr/local/sbin /usr/bin /usr/sbin $PATH
set -gx PATH ./bin $HOME/bin $HOME/sh $PATH

# GoRoot
set -gx GOPATH $HOME
set -gx PATH $PATH $GOPATH/bin /usr/local/opt/go/libexec/bin

#rbenv
set -gx PATH /usr/local/opt/rbenv/bin $PATH

#flutter
set -gx PATH ~/src/github.com/flutter/flutter/bin $PATH

#homebrew cask
set -gx HOMEBREW_CASK_OPTS "--appdir=/Applications"

# for neovim
set -gx XDG_CONFIG_HOME $HOME/.config
