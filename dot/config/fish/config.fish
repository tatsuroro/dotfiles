# env
source ~/.config/fish/env.fish
source ~/.config/fish/env_local.fish

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

# direnv (for dwh-dbt python env)
direnv hook fish | source

# pyenv
pyenv init - | source

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/opt/homebrew/share/google-cloud-sdk/path.fish.inc' ]; . '/opt/homebrew/share/google-cloud-sdk/path.fish.inc'; end
