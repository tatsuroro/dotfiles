export PATH=./bin:$HOME/bin:$HOME/.nodebrew/current/bin:$PATH

nodebrew use v0.12

export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:$PATH

# php-cli use homebrew
export PATH="$(brew --prefix homebrew/php/php54)/bin:$PATH"

#rbenv
if which rbenv > /dev/null; then
    eval "$(rbenv init -)";
fi

 [[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator]]
