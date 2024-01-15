function fish_prompt --description 'Write out the prompt'
  echo -n (set_color cyan)(prompt_pwd)(fish_git_prompt)' '(set_color red)'❯'(set_color yellow)'❯'(set_color green)'❯ '
end
