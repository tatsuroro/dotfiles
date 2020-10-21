function fzf_git_branch_checkout
  set -l selected (git branch | fzf)

  [ -n "$selected" ] && eval "git checkout $selected" && eval "git pull"

  commandline -f repaint
end
