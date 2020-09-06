set -gx LANG ja_JP.UTF-8
set -gx EDITOR nvim
set -gx SHELL /usr/local/bin/fish

# for docui
set -gx LC_CTYPE=en_US.UTF-8
set -gx TERM=xterm-256color

# for neovim
set -gx XDG_CONFIG_HOME $HOME/.config

# PATH
set -gx PATH ./bin $HOME/sh $PATH
## GoRoot
set -gx GOPATH $HOME
set -gx PATH $PATH $GOPATH/bin /usr/local/opt/go/libexec/bin
## flutter
set -gx PATH $PATH $HOME/src/github.com/flutter/flutter/bin
## deno
set -gx PATH $PATH $HOME/.deno/bin

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/tatsuroro/google-cloud-sdk/path.fish.inc' ]; . '/Users/tatsuroro/google-cloud-sdk/path.fish.inc'; end
