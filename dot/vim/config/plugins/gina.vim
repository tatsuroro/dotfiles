" gina.vim

nnoremap <Leader>gd :<C-u>Gina diff<CR>
nnoremap <Leader>gs :<C-u>Gina status<CR>
nnoremap <Leader>gl :<C-u>Gina log<CR>

" view latest commit of open file
nnoremap <Leader>gr :<C-u>Gina read<CR>

" git add open file
nnoremap <Leader>ga :<C-u>Gina write<CR>
nnoremap <Leader>gc :<C-u>Gina commit<CR>
nnoremap <Leader>gb :<C-u>Gina blame<CR>
