let g:floaterm_keymap_new = '<Leader>fn'
let g:floaterm_width = 0.9
let g:floaterm_height = 0.9

" Set floaterm window background to gray once the cursor moves out from it
hi FloatermNC guibg=gray

nnoremap <silent><C-p> :FloatermNew fzf<CR>
nnoremap <silent><C-n> :FloatermNew fff<CR>
nnoremap <silent><leader>ti :FloatermNew --autoclose=2 tig<CR>

