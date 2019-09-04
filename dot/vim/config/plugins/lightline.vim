let g:lightline = {
\   'active': {
\     'left': [
\       ['mode', 'paste'],
\       ['cocstatus', 'readonly', 'filename', 'modified'],
\     ],
\     'right': [
\       [ 'percent' ],
\       [ 'fileformat', 'fileencoding', 'filetype' ],
\       [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ],
\     ],
\   },
\   'component_function': {
\     'cocstatus': 'coc#status'
\   },
\   'colorscheme': 'tender'
\ }

let g:lightline.component_expand = {
\   'linter_checking': 'lightline#ale#checking',
\   'linter_warnings': 'lightline#ale#warnings',
\   'linter_errors': 'lightline#ale#errors',
\   'linter_ok': 'lightline#ale#ok',
\ }

let g:lightline.component_type = {
\   'linter_checking': 'left',
\   'linter_warnings': 'warning',
\   'linter_errors': 'error',
\   'linter_ok': 'left',
\ }
