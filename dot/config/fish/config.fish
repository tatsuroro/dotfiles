# env
source ~/.config/fish/env.fish
# source ~/.config/fish/env_local.fish

# Ensure fisherman and plugins are installed
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

# fff
# Fish don't support recursive calls so use f function
function f
    fff $argv
    set -q XDG_CACHE_HOME; or set XDG_CACHE_HOME $HOME/.cache
    cd (cat $XDG_CACHE_HOME/fff/.fff_d)
end

# fisher/fzf
set -U FZF_LEGACY_KEYBINDINGS 0
set -x FZF_DEFAULT_COMMAND 'fd'
set -x FZF_FIND_FILE_COMMAND $FZF_DEFAULT_COMMAND

# alias & functions
if status is-interactive
    source ~/.config/fish/aliases.fish
end

# direnv
# direnv hook fish | source

