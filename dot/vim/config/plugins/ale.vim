let g:ale_fixers = {
  \ 'javascript': ['prettier'],
  \ 'jsx': ['prettier'],
  \ 'typescript': ['prettier'],
  \ 'tsx': ['prettier'],
  \ 'python': ['autopep8', 'isort'],
  \ }

let g:ale_javascript_prettier_use_local_config = 1
let g:ale_javascript_prettier_options = '--single-quote'
let g:ale_javascript_prettier_eslint_options = '--single-quote'

" let g:ale_fix_on_save = 1
