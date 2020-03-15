# env
source ~/.config/fish/env.fish
source ~/.config/fish/env_local.fish

# !! hoge-env init script has been replaced with fisherman init plugins

# Ensure fisherman and plugins are installed
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

# fisher/fzf
set -U FZF_LEGACY_KEYBINDINGS 0
set -x FZF_DEFAULT_COMMAND 'fd'
set -x FZF_FIND_FILE_COMMAND $FZF_DEFAULT_COMMAND

# alias & functions
source ~/.config/fish/aliases.fish

# direnv
direnv hook fish | source

# starship
# starship init fish | source
