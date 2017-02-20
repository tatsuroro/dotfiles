export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:$PATH
export PATH=./bin:$HOME/bin:$PATH

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# GoRoot
export GOPATH=$HOME
export PATH="$PATH:$GOPATH/bin:/usr/local/opt/go/libexec/bin"

# nodenv
export NODENV_ROOT="/usr/local/var/nodenv"

# rbenv
export RBENV_ROOT="/usr/local/var/rbenv"
export PATH="/usr/local/opt/rbenv/bin:$PATH"

# shell scripts
export PATH="$PATH:$HOME/Dropbox/sh"

typeset -gxU PATH

[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator]]

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# for neovim
export XDG_CONFIG_HOME=$HOME/.config

export ZPLUG_HOME=/usr/local/opt/zplug
