setopt auto_cd
setopt correct
setopt no_beep
setopt nolistbeep

setopt list_types
setopt list_packed
setopt no_case_glob
setopt complete_in_word
setopt prompt_subst
setopt rm_star_silent

# 補完
# 引数 = 以降でも補完
setopt magic_equal_subst
setopt auto_menu
setopt auto_name_dirs
setopt auto_remove_slash
setopt auto_param_keys
setopt auto_param_slash

setopt print_eight_bit

# 範囲指定できるようにする
# 例 : mkdir {1-3} で フォルダ1, 2, 3を作れる
setopt brace_ccl

export DIRSTACKSIZE=100
setopt auto_pushd
setopt pushd_ignore_dups

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HISTFILE=~/.zsh_history
HIST_STAMPS="yyyy-mm-dd"

HISTSIZE=10000
SAVEHIST=10000
setopt share_history
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_expand
setopt inc_append_history
setopt extended_history

# dont save dupulicate commands && no needs commands
export HISTCONTROL=ignoreboth:erasedups
export HISTIGNORE="ls:ls *:la:la *:cd:cd -:pwd"

# zplug
source $ZPLUG_HOME/init.zsh

zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "Tarrasch/zsh-bd"

#oh-my-zsh
zplug "plugins/brew", from:oh-my-zsh, if:"which brew"
zplug "plugins/git", from:oh-my-zsh, if:"which git"
zplug "plugins/tmux", from:oh-my-zsh, if:"which tmux"
zplug "plugins/rails", from:oh-my-zsh, if:"which rails"
zplug "plugins/ruby", from:oh-my-zsh, if:"which ruby"
zplug "plugins/rbenv", from:oh-my-zsh, if:"which rbenv"
zplug "plugins/nodenv", from:oh-my-zsh, if:"which nodenv"

zplug "themes/wedisagree", from:oh-my-zsh

if ! zplug check; then
  printf "Install zplug items? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

# source plugins and add command to PATH
zplug load

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

export EDITOR='nvim'
export SHELL='/usr/local/bin/zsh'

 #direnv bootstrap
eval "$(direnv hook zsh)"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

export TERM=xterm-256color

# enable load
autoload -Uz compinit && compinit

zstyle ':completion:*' menu select
zstyle ':completion:*:cd:*' ignore-parents parent pwd
zstyle ':completion:*:descriptions' format '%BCompleting%b %U%d%u'

typeset -ga chpwd_functions
chpwd_functions+=_cdd_chpwd

# hoge-env
if which nodenv > /dev/null; then eval "$(nodenv init -)"; fi
if which rbenv > /dev/null; then  eval "$(rbenv init -)"; fi

# autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# ghq peco repo search
function peco-src() {
  local selected_dir=$(ghq list --full-path | awk '!a[$0]++' | peco --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-src

# command history search
function peco-select-history() {
  local tac
  if which tac > /dev/null; then
    tac="tac"
  else
    tac="tail -r"
  fi
  BUFFER=$(history -n 1 | \
    eval $tac | \
    awk '!a[$0]++' | \
    peco --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle clear-screen
}
zle -N peco-select-history

# peco file search
function peco-path() {
  local filepath="$(find . | grep -v '/\.' | peco --prompt 'PATH>')"
  [ -z "$filepath" ] && return
  if [ -n "$LBUFFER" ]; then
    BUFFER="$LBUFFER$filepath"
  else
    if [ -d "$filepath" ]; then
      BUFFER="cd $filepath"
    elif [ -f "$filepath" ]; then
      BUFFER="$EDITOR $filepath"
    fi
  fi
  CURSOR=$#BUFFER
}
zle -N peco-path

# peco process kill
function peco-kill-process() {
  ps -ef | peco | awk '{ print $2 }' | xargs kill
  zle clear-screen
}
zle -N peco-kill-process

function peco-git-branch () {
  local current_buffer=$BUFFER
  local selected_branch_name="$(git branch -a | peco | tr -d ' ' | tr -d '*')"
  case "$selected_branch_name" in
    *-\>* )
      selected_branch_name="$(echo ${selected_branch_name} | perl -ne 's/^.*->(.*?)\/(.*)$/\2/;print')";;
    remotes* )
      selected_branch_name="$(echo ${selected_branch_name} | perl -ne 's/^.*?remotes\/(.*?)\/(.*)$/\2/;print')";;
  esac
  if [ -n "$selected_branch_name" ]; then
    BUFFER="${current_buffer}${selected_branch_name}"
    CURSOR=$#BUFFER
  fi
}
zle -N peco-git-branch

function peco-git-hash () {
  local current_buffer=$BUFFER
  local git_hash="$(git log --oneline --branches | peco | awk '{print $1}')"
  BUFFER="${current_buffer}${git_hash}"
  # move cursor pos to line end
  CURSOR=$#BUFFER
}
zle -N peco-git-hash

function peco-git-stash () {
  local current_buffer=$BUFFER
  local stash="$(git stash list | peco | awk -F'[ :]' '{print $1}')"
  BUFFER="${current_buffer}${stash}"
  # move cursor pos to line end
  CURSOR=$#BUFFER
}
zle -N peco-git-stash

# keybind
bindkey -e
bindkey '^s' peco-src
bindkey '^r' peco-select-history
bindkey '^z' peco-path
bindkey '^q' peco-kill-process
bindkey '^fb' peco-git-branch
bindkey '^fh' peco-git-hash
bindkey '^fs' peco-git-stash
stty -ixon

#alias
alias sudo="sudo "
alias v="vim"
alias nv="nvim"
alias vi="vim"
alias sed="gsed"
alias tm="tmux"
alias mux="tmuxinator"
alias gat="gatsby"

alias gfx="git fixup"
alias gbra="git branch-list"

alias ls="ls -GAF"
alias la="ls -la"

alias zrc="nvim ~/dotfiles/.zsh/.zshrc"
