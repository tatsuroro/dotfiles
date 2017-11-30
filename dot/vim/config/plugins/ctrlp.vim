""" ctrlp

let g:ctrlp_open_new_file = 'r'
let g:ctrlp_extensions = ['root', 'mixed']
let g:ctrlp_match_func = {'match': 'cpsm#CtrlPMatch'}
let g:ctrlp_match_window = 'bottom,min:1,max:40'
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/](node_modules|tmp|temp|\.(git|hg|hgn|svn))$',
  \ 'file': '\v\.(exe|so|dll|png|jpg|gif)$',
  \ 'link': '',
  \ }
let g:ctrlp_max_files = 100000
let g:ctrlp_max_depth = 40
" use mattn/files for file list (need to `go install mattn/files`)
let g:ctrlp_user_command = 'files -a -i "^(.git|node_modules)\$" %s'
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
nnoremap <silent><C-s> :<C-u>CtrlPSearchHistory<CR>
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
