let g:tsuquyomi_disable_quickfix = 0
let g:tsuquyomi_shortest_import_path = 1
let g:tsuquyomi_case_sensitive_imports = 1
let g:tsuquyomi_single_quote_import = 1
let g:tsuquyomi_baseurl_import_path = 1

" " show tooltip of symbol under the mouse cursor
set ballooneval
autocmd FileType typescript setlocal balloonexpr=tsuquyomi#balloonexpr()

" show tooltip command
function! s:ts_hint()
  let content = tsuquyomi#hint()
  silent pedit __TsuquyomiScratch__
  silent wincmd P
  setlocal modifiable noreadonly
  setlocal nobuflisted buftype=nofile bufhidden=wipe ft=typescript
  put =content
  0d_
  setlocal nomodifiable readonly
  silent wincmd p
endfunction

command! TsHint silent! :call s:ts_hint()
noremap <silent> <buffer> <Plug>(TsuHint) :TsuHint<CR>

autocmd FileType typescript nnoremap <buffer> <C-i> :TsHint<CR>

