set -gx LANG ja_JP.UTF-8
set -gx EDITOR nvim
set -gx SHELL /opt/homebrew/bin/fish

# for neovim
set -gx XDG_CONFIG_HOME $HOME/.config

# volta
set -gx VOLTA_HOME $HOME/.volta

# Java
set -gx CPPFLAGS "-I/opt/homebrew/opt/openjdk/include"

# GoRoot
set -gx GOPATH $HOME

# deno
set -gx PATH $PATH $HOME/.deno/bin

# libpq
set -gx LDFLAGS "-L/opt/homebrew/opt/libpq/lib"
set -gx CPPFLAGS "-I/opt/homebrew/opt/libpq/include"

set -gx PKG_CONFIG_PATH "/opt/homebrew/opt/libpq/lib/pkgconfig"

# pyenv
set -gx PYENV_ROOT $HOME/.pyenv

# ubie
set -gx PATH $PATH $HOME/.ubie-bin

