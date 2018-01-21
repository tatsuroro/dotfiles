let g:lsp_log_verbose = 1
let g:lsp_log_file = expand('~/vim-lsp.log')

" for asyncomplete.vim log
let g:asyncomplete_log_file = expand('~/asyncomplete.log')

" let g:lsp_async_completion = 1

" omni complete config
" autocmd FileType typescript setlocal omnifunc=lsp#complete
" autocmd FileType typescript.tsx setlocal omnifunc=lsp#complete
" autocmd FileType javascript setlocal omnifunc=lsp#complete
" autocmd FileType javascript setlocal omnifunc=lsp#complete

""" register servers
if executable('typescript-language-server')
  autocmd User lsp_setup call lsp#register_server({
      \ 'name': 'typescript-language-server',
      \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
      \ 'root_uri': { server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_directory(lsp#utils#get_buffer_path(), '.git/..'))},
      \ 'whitelist': ['typescript', 'typescript.tsx', 'javascript', 'javascript.jsx']
      \ })
endif
