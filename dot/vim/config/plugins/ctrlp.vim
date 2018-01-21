""" ctrlp

let g:ctrlp_open_new_file = 'r'
let g:ctrlp_extensions = ['root', 'mixed']
let g:ctrlp_match_func = {'match': 'cpsm#CtrlPMatch'}
let g:ctrlp_match_window = 'bottom,min:1,max:40'
let g:ctrlp_show_hidden = 1
let g:ctrlp_max_files = 100000
let g:ctrlp_max_depth = 40
"
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

let g:ctrlp_root_markers = ['.git', 'package.json', 'Gemfile', 'build.xml']

  let g:ctrlp_prompt_mappings = {
    \ 'PrtDelete()':          ['<c-d>', '<del>'],
    \ 'PrtClear()':           ['<c-k>'],
    \ 'PrtSelectMove("j")':   ['<c-n>', '<down>'],
    \ 'PrtSelectMove("k")':   ['<c-p>', '<up>'],
    \ 'PrtHistory(-1)':       ['<c-j>'],
    \ 'PrtHistory(1)':        ['<c-l>'],
    \ 'PrtCurLeft()':         ['<c-b>', '<left>', '<c-^>'],
    \ 'PrtCurRight()':        ['<c-f>', '<right>'],
    \ 'PrtExit()'   :         ['<ESC>', '<c-g>', '<c-c>', '<c-q>'],
    \ 'ToggleByFname()':      ['<c-t>'],
  \ }

""" keymap
nnoremap <silent><C-p> :CtrlPRoot<CR>
nnoremap <silent><C-m> :CtrlPMRU<CR>
nnoremap <Leader>b :<C-u>CtrlPBuffer<CR>
nnoremap <Leader>l :<C-u>CtrlPClearAllCaches<CR>
" ctrlp-history
nnoremap <silent><C-e> :<C-u>CtrlPCmdHistory<CR>
nnoremap <silent><C-s> :<C-u>CtrlPGhq<cr>
" ctrlp-register
nnoremap <silent><C-y> :<C-u>CtrlPRegister<CR>
" ctrlp-filetype
nnoremap <silent><Leader>f :<C-u>CtrlPFiletype<CR>
" ctrlp-ag
nnoremap <silent>,f :<C-u>CtrlPag<CR>
vnoremap <silent>,f :<C-u>CtrlPagVisual<CR>
nnoremap <silent>,mf :<C-u>CtrlPagLocate<space>
nnoremap <silent>,r :<C-u>CtrlPagPrevious<CR>
" vim-gista-ctrlp
nnoremap <silent><C-g> :CtrlPGista<CR>
