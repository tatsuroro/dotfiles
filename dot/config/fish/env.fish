set -gx LANG ja_JP.UTF-8
set -gx EDITOR vim
set -gx SHELL /usr/local/bin/fish

# for neovim
set -gx XDG_CONFIG_HOME $HOME/.config

### PATH
set -gx PATH ./bin $HOME/src/github.com/tatsuroro/sh $PATH
# GoRoot
set -gx GOPATH $HOME
set -gx PATH $PATH $GOPATH/bin /usr/local/opt/go/libexec/bin
#flutter
set -gx PATH $HOME/src/github.com/flutter/flutter/bin $PATH
