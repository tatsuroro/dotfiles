let g:ale_fixers = {
  \ 'javascript': ['prettier'],
  \ 'jsx': ['prettier'],
  \ 'typescript': ['prettier'],
  \ 'python': ['autopep8', 'isort'],
  \ }

let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es5'
let g:ale_javascript_prettier_eslint_options = '--single-quote --trailing-comma es5'

let g:ale_fix_on_save = 1
