set -gx LANG ja_JP.UTF-8
set -gx EDITOR nvim
set -gx SHELL /opt/homebrew/bin/fish

# for neovim
set -gx XDG_CONFIG_HOME $HOME/.config

# volta
set -gx VOLTA_HOME $HOME/.volta

# PATH
set -gx PATH ./bin $HOME/sh $HOME/Dropbox/dev/tmux $VOLTA_HOME/bin $PATH

## GoRoot
set -gx GOPATH $HOME
set -gx PATH $PATH $GOPATH/bin /opt/homebrew/opt/go/libexec/bin

## flutter
set -gx PATH $PATH $HOME/src/github.com/flutter/flutter/bin

## deno
set -gx PATH $PATH $HOME/.deno/bin

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/tatsuroro/google-cloud-sdk/path.fish.inc' ]; . '/Users/tatsuroro/google-cloud-sdk/path.fish.inc'; end
