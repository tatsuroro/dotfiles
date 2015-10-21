export PATH=./bin:$HOME/bin:$HOME/.nodebrew/current/bin:$PATH

export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:$PATH

#rbenv
if which rbenv > /dev/null; then
    eval "$(rbenv init -)";
fi

 [[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator]]
