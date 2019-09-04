" let g:ale_fixers = {
"  \ 'javascript': ['prettier'],
"  \ 'jsx': ['prettier'],
"  \ 'typescript': ['prettier'],
"  \ 'tsx': ['prettier'],
"  \ 'python': ['autopep8', 'isort'],
"  \ }
"
let g:ale_javascript_prettier_use_local_config = 1
" let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es5'
" let g:ale_javascript_prettier_eslint_options = '--single-quote --trailing-comma es5'
"
" let g:ale_fix_on_save = 1
"
let g:ale_statusline_format = ['E%d', 'W%d', '']
let g:ale_echo_msg_format = '[%linter%] %s'
"
" nmap <silent> <C-j> <Plug>(ale_next_wrap)
" nmap <silent> <C-k> <Plug>(ale_previous_wrap)

