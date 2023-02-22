function fish_prompt --description 'Write out the prompt'
  echo -n (set_color cyan)(prompt_pwd)' '(set_color red)'❯'(set_color yellow)'❯'(set_color green)'❯ '
end

function fish_right_prompt
  echo -n (fish_git_prompt)
end
