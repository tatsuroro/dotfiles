function fish_prompt --description 'Write out the prompt'
  test $SSH_TTY
    and printf (set_color red)$USER(set_color brwhite)'@'(set_color yellow)(prompt_hostname)' '
  test $USER = 'root'
    and echo (set_color red)"#"

  echo -n (set_color cyan)(prompt_pwd)' '(set_color red)'❯'(set_color yellow)'❯'(set_color green)'❯ '
end

function fish_right_prompt
  set laststatus $status

  function _git_branch_name
    echo (git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
  end

  function _is_git_dirty
    echo (git status -s --ignore-submodules=dirty ^/dev/null)
  end

  if [ (_git_branch_name) ]
    set -l git_branch (set_color -o blue)(_git_branch_name)

    if [ (_is_git_dirty) ]
      for i in (git branch -qv --no-color | string match -r '\*' | cut -d' ' -f4- | cut -d] -f1 | tr , \n)\
(git status --porcelain | cut -c 1-2 | uniq)
        switch $i
          case "*[ahead *"
            set git_status "$git_status"(set_color red)⬆
          case "*behind *"
            set git_status "$git_status"(set_color red)⬇
          case "."
            set git_status "$git_status"(set_color green)✚
          case " D"
            set git_status "$git_status"(set_color red)✖
          case "*M*"
            set git_status "$git_status"(set_color green)✱
          case "*R*"
            set git_status "$git_status"(set_color purple)➜
          case "*U*"
            set git_status "$git_status"(set_color brown)═
          case "??"
            set git_status "$git_status"(set_color red)≠
        end
      end
    else
      set git_status (set_color green)✔
    end

    set git_info "$git_branch $git_status"
  end

  # Git status
  echo $git_info
end
