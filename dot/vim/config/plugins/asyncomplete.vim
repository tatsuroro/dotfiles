if !isdirectory(expand("~/.vim/plugged/asyncomplete.vim"))
  finish
endif

inoremap <expr> <C-n>   pumvisible() ? "\<Down>": "\<C-n>"
inoremap <expr> <C-p>   pumvisible() ? "\<Up>"  : "\<C-p>"
inoremap <expr> <C-j>   pumvisible() ? "\<Down>": "\<C-j>"
inoremap <expr> <C-k>   pumvisible() ? "\<Up>"  : "\<C-k>"
inoremap <expr> <S-Tab> pumvisible() ? "\<Up>" : "\<S-Tab>"
inoremap <expr> <Tab>   pumvisible() ? "\<C-y>" : "\<Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"

let g:asyncomplete_auto_popup = 1
let g:asyncomplete_auto_completeopt = 0

let g:asyncomplete_log_file = '/tmp/vim.log'

augroup Asyncomplete
  autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
augroup END

function! s:sort_by_priority_preprocessor(options, matches) abort
    let l:items = []
    let l:startcols = []
    for [l:source_name, l:matches] in items(a:matches)
        let l:startcol = l:matches['startcol']
        let l:base = a:options['typed'][l:startcol - 1:]
        for l:item in l:matches['items']
            if stridx(l:item['word'], l:base) == 0
                let l:startcols += [l:startcol]
                let l:item['priority'] =
                            \ get(asyncomplete#get_source_info(l:source_name), 'priority', 0)
                call add(l:items, l:item)
            endif
        endfor
    endfor

    let a:options['startcol'] = min(l:startcols)
    let l:items = sort(l:items, {a, b -> a['priority'] - b['priority']})

    call asyncomplete#preprocess_complete(a:options, l:items)
endfunction

let g:asyncomplete_preprocessor = [function('s:sort_by_priority_preprocessor')]

if isdirectory(expand("~/.vim/plugged/asyncomplete-file.vim"))
  call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
      \ 'name': 'file',
      \ 'whitelist': ['*'],
      \ 'priority': 10,
      \ 'completor': function('asyncomplete#sources#file#completor')
      \ }))
endif

if isdirectory(expand("~/.vim/plugged/asyncomplete-around.vim"))
  call asyncomplete#register_source(asyncomplete#sources#around#get_source_options({
      \ 'name': 'around',
      \ 'allowlist': ['*'],
      \ 'priority': 10,
      \ 'completor': function('asyncomplete#sources#around#completor'),
      \ }))

  let g:asyncomplete_around_range = 50
endif

