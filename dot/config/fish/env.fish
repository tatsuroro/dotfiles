set -gx LANG ja_JP.UTF-8
set -gx EDITOR nvim
set -gx SHELL /opt/homebrew/bin/fish

# homebrew
fish_add_path /opt/homebrew/bin

# for neovim
set -gx XDG_CONFIG_HOME $HOME/.config

# volta
set -gx VOLTA_HOME $HOME/.volta

# Java
fish_add_path /opt/homebrew/opt/openjdk/bin
set -gx CPPFLAGS "-I/opt/homebrew/opt/openjdk/include"

# GoRoot
set -gx GOPATH $HOME
set -gx PATH $PATH $GOPATH/bin /opt/homebrew/opt/go/libexec/bin

# flutter
set -gx PATH $PATH $HOME/src/github.com/flutter/flutter/bin

# deno
set -gx PATH $PATH $HOME/.deno/bin

# libpq
fish_add_path /opt/homebrew/opt/libpq/bin
set -gx LDFLAGS "-L/opt/homebrew/opt/libpq/lib"
set -gx CPPFLAGS "-I/opt/homebrew/opt/libpq/include"

set -gx PKG_CONFIG_PATH "/opt/homebrew/opt/libpq/lib/pkgconfig"

# misc PATH
set -gx PATH ./bin $HOME/sh $HOME/Dropbox/dev/tmux $VOLTA_HOME/bin $PATH

