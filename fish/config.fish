# alias & functions
. ~/.config/fish/aliases.fish

# env
. ~/.config/fish/env.fish

# hogeenv
set -gx NODENV_ROOT /usr/local/var/nodenv
set -gx RBENV_ROOT /usr/local/var/rbenv

if test nodenv
  eval (nodenv init - | source)
end
if test rbenv
  eval (rbenv init - | source)
end

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
