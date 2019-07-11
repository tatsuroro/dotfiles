function fzf_select_ghq_repository
  set -l query (commandline)

  if test -n $query
    set fzf_flags --query "$query"
  end

  ghq list | fzf $fzf_flags | read line

  if [ $line ]
    ghq look $line
    commandline -f repaint
  end
end
