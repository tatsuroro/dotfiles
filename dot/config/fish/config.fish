# env
. ~/.config/fish/env.fish

# !! hoge-env init script has been replaced with fisherman init plugins

# Ensure fisherman and plugins are installed
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

function peco
  command peco --layout=bottom-up $argv
end

function cd
  if test (count $argv) -eq 0
    return 0
  else if test (count $argv) -gt 1
    printf "%s\n" (_ "Too many args for cd command")
    return 1
  end

  # Avoid set completions.
  set -l previous $PWD

  if test "$argv" = "-"
    if test "$__fish_cd_direction" = "next"
      nextd
    else
      prevd
    end

    return $status
  end

  builtin cd $argv
  set -l cd_status $status

  # Log history
  if test $cd_status -eq 0 -a "$PWD" != "$previous"
    set -q dirprev[$MAX_DIR_HIST]
    and set -e dirprev[1]
    set -g dirprev $dirprev $previous
    set -e dirnext
    set -g __fish_cd_direction prev
  end

  if test $cd_status -ne 0
    return 1
  end

  ls

  return $status
end

# alias & functions
. ~/.config/fish/aliases.fish

# direnv
direnv hook fish | source
