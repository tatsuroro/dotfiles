# alias & functions
. ~/.config/fish/aliases.fish

# env
. ~/.config/fish/env.fish

# !! hoge-env init script has been replaced with fisherman init plugins

# Ensure fisherman and plugins are installed
if not test -f $HOME/.config/fish/functions/fisher.fish
  echo "==> Fisherman not found.  Installing."
  curl -sLo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher
  fisher
end

function peco
  command peco --layout=bottom-up $argv
end

function ghq-remove
  ghq list --full-path | peco | xargs rm -r
end
