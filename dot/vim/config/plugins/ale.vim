if !isdirectory(expand("~/.vim/plugged/ale"))
  finish
endif

let g:ale_fix_on_save = 1
let g:ale_lnter_aliases = { 'tsx': 'css' }

let g:ale_javascript_prettier_use_local_config = 1

let g:ale_statusline_format = ['E%d', 'W%d', '']
let g:ale_echo_msg_format = '[%linter%] %s'

let g:ale_fixers = {
\ 'javascript': ['prettier'],
\ 'jsx': ['prettier'],
\ 'typescript': ['eslint', 'prettier'],
\ 'tsx': ['eslint', 'prettier'],
\ 'html': ['prettier'],
\ 'ruby': ['rubocop'],
\ 'python': ['autopep8', 'isort'],
\ }

let g:ale_linters = {
\ 'css': ['stylelint'],
\ 'javascript': ['eslint'],
\ 'jsx': ['eslint'],
\ 'typescript': ['eslint'],
\ 'tsx': ['eslint'],
\ }

" nmap <silent> <C-j> <Plug>(ale_next_wrap)
" nmap <silent> <C-k> <Plug>(ale_previous_wrap)

