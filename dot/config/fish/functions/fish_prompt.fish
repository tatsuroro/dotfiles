function fish_prompt --description 'Write out the prompt'
  test $SSH_TTY
    and printf (set_color red)$USER(set_color brwhite)'@'(set_color yellow)(prompt_hostname)' '
  test $USER = 'root'
    and echo (set_color red)"#"

  echo -n (set_color cyan)(prompt_pwd)' '(set_color red)'❯'(set_color yellow)'❯'(set_color green)'❯ '
end

function fish_right_prompt
  echo -n (fish_git_prompt)
end
