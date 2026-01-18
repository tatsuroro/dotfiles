function fzf_select_ghq_repository
  set -l selected (ghq list | fzf)

  [ -n "$selected" ] && eval "cd (ghq root)/$selected"

  commandline -f repaint
end
