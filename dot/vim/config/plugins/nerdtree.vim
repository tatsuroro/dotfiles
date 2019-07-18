" init: Show nerdtree on init if cli
if has('gui_running')
  " noop
else
  augroup NERD
      au!
      autocmd VimEnter * NERDTree
      autocmd VimEnter * wincmd p
  augroup END

  " Close vim when opend buffer is only nerdtree
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
endif

" Plugin config
let g:NERDTreeShowHidden = 1

" let g:NERDTreeDirArrowExpandable = '>'
" let g:NERDTreeDirArrowCollapsible = '▾'

" NERDTREE sync
let g:nerdtree_sync_cursorline = 1

" Keymap
let g:NERDTreeMapActivateNode = 'l'
let g:NERDTreeMapCloseDir = 'h'

nnoremap <silent><C-n> :NERDTreeToggle<CR>
nnoremap <silent><C-o> :NERDTreeFocus<CR>

