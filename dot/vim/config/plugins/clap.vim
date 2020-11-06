let g:clap_layout = { 'width': '70%', 'height': '70%', 'row': '20%', 'col': '15%'}

nnoremap <leader>b :Clap buffers<CR>
nnoremap <silent><C-m> :Clap history<CR>
nnoremap <silent><C-e> :Clap command_history<CR>

nnoremap <leader>l :Clap lines<CR>
nnoremap <leader>y :Clap yanks<CR>

nnoremap <leader>ff :Clap grep<CR>
nnoremap <leader>fd :Clap grep ++query=<cword><CR>

""" for MacVim
if has('gui_running')
  nnoremap <silent><C-p> :Clap files<CR>
endif
