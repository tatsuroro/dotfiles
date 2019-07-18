function fzf_git_branch_checkout
  set -l selected (git branch -a | fzf)

  [ -n "$selected" ] && eval "git checkout $selected"

  commandline -f repaint
end
