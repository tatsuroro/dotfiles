let g:asyncomplete_remove_duplicates = 1

" auto close preview window when completion is done
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
imap <c-space> <Plug>(asyncomplete_force_refresh)

" show the popup or can you tab to show the autocomplete
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ asyncomplete#force_refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

augroup Asyncomplete
  autocmd!

  "tscompletejob
  autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#tscompletejob#get_source_options({
    \ 'name': 'tscompletejob',
    \ 'whitelist': ['typescript'],
    \ 'completor': function('asyncomplete#sources#tscompletejob#completor'),
    \ }))

  " buffer
  autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
    \ 'name': 'buffer',
    \ 'whitelist': ['*'],
    \ 'blacklist': ['go'],
    \ 'completor': function('asyncomplete#sources#buffer#completor'),
    \ }))

  " file
  autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
    \ 'name': 'file',
    \ 'whitelist': ['*'],
    \ 'priority': 10,
    \ 'completor': function('asyncomplete#sources#file#completor')
    \ }))

  " neco-vim
  autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#necovim#get_source_options({
    \ 'name': 'necovim',
    \ 'whitelist': ['vim'],
    \ 'completor': function('asyncomplete#sources#necovim#completor'),
    \ }))

  " omni
  " autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#omni#get_source_options({
  "  \ 'name': 'omni',
  "  \ 'whitelist': ['*'],
  "  \ 'blacklist': ['c', 'cpp', 'html'],
  "  \ 'completor': function('asyncomplete#sources#omni#completor')
  "  \ }))
augroup END

" tmux-complete
let g:tmuxcomplete#asyncomplete_source_options = {
  \ 'name': 'tmuxcomplete',
  \ 'whitelist': ['*'],
  \ 'config': {
  \   'splitmode': 'words',
  \   'filter_prefix':   1,
  \   'show_incomplete': 1,
  \   'sort_candidates': 0,
  \   'scrollback':      0,
  \   'truncate':        0
  \   }
  \ }

