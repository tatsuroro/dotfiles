function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" init: Show nerdtree on init if cli
if has('gui_running')
  " noop
else
  augroup NERD
      au!
      autocmd VimEnter * NERDTree
      autocmd VimEnter * wincmd p
      " autocmd BufEnter * call SyncTree()
  augroup END

  " Close vim when opend buffer is only nerdtree
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
endif

" Plugin config
let g:NERDTreeShowHidden = 1
let g:NERDTreeChDirMode = 2
let g:NERDTreeGitStatusWithFlags = 1

" let g:NERDTreeDirArrowExpandable = '>'
" let g:NERDTreeDirArrowCollapsible = '▾'

" NERDTREE sync
let g:nerdtree_sync_cursorline = 1

" Keymap
let g:NERDTreeMapActivateNode = 'l'
let g:NERDTreeMapCloseDir = 'h'

nnoremap <silent><C-n> :NERDTreeToggle<CR>
nnoremap <silent><C-o> :NERDTreeFocus<CR>

