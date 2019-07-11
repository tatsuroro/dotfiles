function fzf_select_ghq_repository
  ghq list --full-path | fzf | read select
  [ -n $select ] && cd $select
  commandline -f repaint
end
