let g:lightline = {
\ 'active': {
\   'left': [
\     ['mode', 'paste'],
\     ['readonly', 'filename', 'modified'],
\   ]
\ },
\ 'component_function': {
\   'ale': 'ALEStatus'
\ }
\ }

" function! ALEStatus()
"  return ALEGetStatusLine()
"endfunction

