" init
if has('gui_running')
 " noop
else
  autocmd VimEnter * NERDTree

  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
endif

" Plugin config
" let g:NERDTreeDirArrowExpandable = '>'
" let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeMapActivateNode = 'l'
let g:NERDTreeMapCloseDir = 'h'

" Keymap
nnoremap <silent><C-n> :NERDTreeToggle<CR>
nnoremap <silent><C-o> :NERDTreeFocus<CR>

