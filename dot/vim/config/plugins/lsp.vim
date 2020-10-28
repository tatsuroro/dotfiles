function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes

  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> <f2> <plug>(lsp-rename)
  nmap <C-]> :LspDefinition<CR>
  nmap <Leader>h :LspHover<CR>
  nnoremap <Leader>hh <c-w><c-z>

  " for completion
  inoremap <expr> <C-n> pumvisible() ? "\<Down>" : "\<C-n>"
  inoremap <expr> <C-p> pumvisible() ? "\<Up>" : "\<C-p>"
  inoremap <expr><TAB> pumvisible() ? "\<Down>" : "\<TAB>"
  inoremap <expr><S-TAB> pumvisible() ? "\<Up>" : "\<S-TAB>"
  inoremap <expr><cr> pumvisible() ? "\<C-y>" : "\<cr>"
endfunction

augroup lsp_install
  au!
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

command! LspDebug let lsp_log_verbose=1 | let lsp_log_file = expand('~/.local/share/nvim/lsp.log')

let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_text_edit_enabled = 0

