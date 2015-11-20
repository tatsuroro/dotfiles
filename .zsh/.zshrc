# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="wedisagree"

alias sudo="sudo "
alias v="vim"
alias vi="vim"
alias tm="tmux"

alias ls="ls -GAF"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

HISTSIZE=10000
SAVEHIST=10000
setopt share_history

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(brew brew-cask git git-hubflow github osx tmux tmuxinator vagrant rails ruby rbenv node npm nvm golang)

# custom plugins
plugins+=(zsh-completions)

source $ZSH/oh-my-zsh.sh

# dont save dupulicate commands && no needs commands
export HISTCONTROL=ignoreboth:erasedups
export HISTIGNORE="ls:ls *:la:la *:cd:cd -:pwd"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

export EDITOR='vim'
export SHELL='/usr/local/bin/zsh'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

export TERM=xterm-256color

# enable load
autoload -Uz compinit && compinit

zstyle ':completion:*' menu select
zstyle ':completion:*:descriptions' format '%BCompleting%b %U%d%u'

typeset -ga chpwd_functions
chpwd_functions+=_cdd_chpwd

#rbenv
if which rbenv > /dev/null; then
    eval "$(rbenv init -)";
fi

## Qiita Rb Api Access Token
export QIITA_ACCESS_TOKEN="3b71f5af9803771ea59b48617fd2ced0460c5d4d"


# ghq peco repo search
function peco-src () {
    local selected_dir=$(ghq list --full-path | peco --query "$LBUFFER")
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-src
bindkey '^S' peco-src

# command history search
function peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(\history -n 1 | \
        eval $tac | \
        peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

