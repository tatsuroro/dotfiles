# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="wedisagree"

# Example aliases
alias zshconfig="s ~/.zshrc"
alias ohmyzsh="s ~/.oh-my-zsh"

alias sudo="sudo "
alias v="vim"
alias vi="vim"
alias tm="tmux"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

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
plugins=(git git-flow osx tmux tmuxinator vagrant scala)

# custom plugins
plugins+=(zsh-completions)

source $ZSH/oh-my-zsh.sh


alias ls="ls -GAF"

# dont save dupulicate commands && no needs commands
export HISTCONTROL=ignoreboth:erasedups
export HISTIGNORE="ls:ls *:la:la *:cd:cd -:pwd"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

export EDITOR='vim'
export SHELL='/usr/local/bin/zsh'

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# GoRoot
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin:/usr/local/opt/go/libexec/bin"

export TERM=xterm-256color

# enable load
autoload -Uz compinit && compinit

zstyle ':completion:*' menu select
zstyle ':completion:*:descriptions' format '%BCompleting%b %U%d%u'

typeset -ga chpwd_functions
chpwd_functions+=_cdd_chpwd


## Qiita Rb Api Access Token
export QIITA_ACCESS_TOKEN="3b71f5af9803771ea59b48617fd2ced0460c5d4d"
