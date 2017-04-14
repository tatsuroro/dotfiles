scriptencoding utf-8

" set Leader
let g:mapleader = "\<Space>"

" disable ex mode
nnoremap Q <Nop>
" disable shortcut exit without save
nnoremap ZQ <Nop>

" set us mode
nnoremap : ;
nnoremap ; :
vnoremap : ;
vnoremap ; :

" yank to end of line
nnoremap Y y$

" increment
nnoremap + <C-a>
nnoremap - <C-x>

" Ctrl+l to Esc
inoremap <silent>jj <Esc>
inoremap <C-L> <Esc>

" esc * 2 -> cancel search highlight
nnoremap <Esc><Esc> :nohlsearch<CR><Esc>

" Command Mode HistoryMove
inoremap <C-K> <Up>
inoremap <C-J> <Down>
inoremap <C-H> <Left>

" 日本語入力がオンのままでも使えるコマンド(Enterキーは必要)
nnoremap あ a
nnoremap い i
nnoremap う u
nnoremap お o

" vv -> select to lineEnd
vnoremap v $h

" delete buffer without close split view
nmap <C-W>w <Plug>Bclose

" quick save
nnoremap <Leader>w :w<CR>

" for masui special. 編集箇所を戻る
noremap g<CR> g;

" qでウインドウを閉じて Qでマクロ
nnoremap Q q

""" operator-replace
nmap R <Plug>(operator-replace)

""" operator-surround
nmap <silent> sa <Plug>(operator-surround-append)
nmap <silent> sd <Plug>(operator-surround-delete)
nmap <silent> sr <Plug>(operator-surround-replace)
" カーソル位置から一番近い括弧を削除する
nmap <silent> sdd <Plug>(operator-surround-delete)<Plug>(textobj-multiblock-a)
" カーソル位置から一番近い括弧を変更する
nmap <silent> srr <Plug>(operator-surround-replace)<Plug>(textobj-multiblock-a)

""" 範囲内検索
nmap <Space>s <Plug>(operator-search)
" require - https://github.com/kana/vim-textobj-function
nmap <Space>/ <Plug>(operator-search)if

" for masui special. 編集箇所を戻る
noremap g<CR> g;

" qでウインドウを閉じて Qでマクロ
nnoremap Q q

" leader + cで行の先頭にコメントをつけたり外したりできる
nmap <Leader>c <Plug>(caw:i:toggle)
vmap <Leader>c <Plug>(caw:i:toggle)

""" ctrlp
nnoremap <silent><C-p> :CtrlPRoot<CR>
nnoremap <silent><C-m> :CtrlPMRU<CR>
nnoremap <Leader>b :<C-u>CtrlPBuffer<CR>
nnoremap <Leader>l :<C-u>CtrlPClearAllCaches<CR>
" ctrlp-history
nnoremap <silent><C-e> :<C-u>CtrlPCmdHistory<CR>
nnoremap <silent><C-s> :<C-u>CtrlPSearchHistory<CR>
" ctrlp-filetype
nnoremap <silent><Leader>f :<C-u>CtrlPFiletype<CR>
" ctrlp-ag
nnoremap <silent>,f :<C-u>CtrlPag<CR>
vnoremap <silent>,f :<C-u>CtrlPagVisual<CR>
nnoremap <silent>,mf :<C-u>CtrlPagLocate<space>
nnoremap <silent>,r :<C-u>CtrlPagPrevious<CR>
" filer
nnoremap <silent><C-k> :CtrlPFiler<CR>
" vim-gista-ctrlp
nnoremap <silent><C-g> :CtrlPGista<CR>

""" fugitive.vim
nnoremap <Leader>gd :<C-u>Gdiff<CR>
nnoremap <Leader>gs :<C-u>Gstatus<CR>
nnoremap <Leader>gl :<C-u>Glog<CR>
" view latest commit of open file
nnoremap <Leader>gr :<C-u>Gread<CR>
" git add open file
nnoremap <Leader>ga :<C-u>Gwrite<CR>
nnoremap <Leader>gc :<C-u>Gcommit<CR>
nnoremap <Leader>gC :<C-u>Git commit --amend<CR>
nnoremap <Leader>gb :<C-u>Gblame<CR>

""" neosnippet
" Plugin key-mappings.
imap <C-t> <Plug>(neosnippet_expand_or_jump)
smap <C-t> <Plug>(neosnippet_expand_or_jump)
xmap <C-t> <Plug>(neosnippet_expand_target)

""" deoplete
" <TAB>: completion.
imap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "{{{
  let l:col = col('.') - 1
  return !l:col || getline('.')[l:col - 1]  =~ '\s'
endfunction"}}}

" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function() abort
  return deoplete#mappings#close_popup() . "\<CR>"
endfunction

" <S-TAB>: completion back.
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<C-h>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> deoplete#mappings#smart_close_popup()."\<C-h>"
inoremap <expr><BS> deoplete#mappings#smart_close_popup()."\<C-h>"
inoremap <expr><C-g> deoplete#mappings#undo_completion()
" <C-l>: redraw candidates
" inoremap <expr><C-l> deoplete#mappings#refresh()

inoremap <expr> '  pumvisible() ? deoplete#mappings#close_popup() : "'"

""" textobj-multiblock
omap ab <Plug>(textobj-multiblock-a)
omap ib <Plug>(textobj-multiblock-i)
vmap ab <Plug>(textobj-multiblock-a)
vmap ib <Plug>(textobj-multiblock-i)

""" vim-quickhl
nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)
nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-resetl)

""" vim-easymotion
nmap q <Plug>(easymotion-s2)
xmap q <Plug>(easymotion-s2)
" surround.vimと被らないように
omap q <Plug>(easymotion-s2)

" -----
" Move Setting

" insert mode での移動
inoremap <C-e> <END>
inoremap <C-a> <HOME>
inoremap <C-b> <Left>
inoremap <C-f> <Right>

" command line mode での移動
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-d> <Del>

" 左右のカーソル移動で行間移動可能にする。
set whichwrap=b,s,<,>,[,]

""" 入力補完
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
inoremap < <><LEFT>

""" window and tab controls
nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sr <C-w>r
nnoremap s= <C-w>=
nnoremap so <C-w>_<C-w>|
nnoremap sO <C-w>=
nnoremap sn :<C-u>bn<CR>
nnoremap sp :<C-u>bp<CR>
nnoremap st :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>bd<CR>
nnoremap sQ :<C-u>q<CR>

" タブ切り替え
nmap <Tab> gt
nmap <S-Tab> gT

" ウインドウサイズ変更
nnoremap <S-Left>  <C-w><<CR>
nnoremap <S-Right> <C-w>><CR>
nnoremap <S-Up>    <C-w>-<CR>
nnoremap <S-Down>  <C-w>+<CR>
