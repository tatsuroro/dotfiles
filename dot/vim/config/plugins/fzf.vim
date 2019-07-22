nnoremap <silent><C-p> :GFiles<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <silent><C-m> :History<CR>
nnoremap <silent><C-e> :History:<CR>

nnoremap <leader>ff :<C-u>Ag<CR>

command! -nargs=0 FGhq call fzf#run({ 'source': 'ghq list --full-path', 'sink': 'cd' })

nnoremap <silent><C-s> :FGhq<CR>
