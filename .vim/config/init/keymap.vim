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

" yank to line end
nnoremap Y y$

" vv -> select to lineEnd
vnoremap v $h

" increment
nnoremap + <C-a>
nnoremap - <C-x>

" Ctrl+l to Esc
inoremap <silent>jj <Esc>
inoremap <C-L> <Esc>

" esc * 2 -> cancel search highlight
nnoremap <Esc><Esc> :nohlsearch<CR><Esc>

" IME off on esc
inoremap <Esc> <Esc>:set iminsert=0<CR>

" enable commands with IME on
nnoremap あ a
nnoremap い i
nnoremap う u
nnoremap お o

" delete buffer without close split view
nmap <C-W>w <Plug>Bclose

" quick save
nnoremap <Leader>w :w<CR>

" back to editted cursor pos
noremap g<CR> g;

" q: close window, Q: macro
nnoremap Q q

""" yank register paste
nnoremap P "0p

""" insert date time
inoremap ,todo <C-R>=strftime('%Y-%m-%d %a')<CR>
inoremap ,date <C-R>=strftime('%Y-%m-%d')<CR>
inoremap ,time <C-R>=strftime('%H:%M:%S')<CR>

""" Move Setting
" disable unneed move
nnoremap <C-j> <Nop>

" cursor controls in insert mode
inoremap <C-e> <END>
inoremap <C-a> <HOME>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-d> <Del>

" cursor controls in command line mode
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-a> <HOME>
cnoremap <C-e> <END>
cnoremap <C-d> <Del>

" enable moving toward lines with left-right cursor
set whichwrap=b,s,<,>,[,]

""" brackets complete
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
inoremap < <><LEFT>
vnoremap { "zdi^V{<C-R>z}<ESC>
vnoremap [ "zdi^V[<C-R>z]<ESC>
vnoremap ( "zdi^V(<C-R>z)<ESC>
vnoremap " "zdi^V"<C-R>z^V"<ESC>
vnoremap ' "zdi'<C-R>z'<ESC>

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
nnoremap st :<C-u>tabnew<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>bd<CR>
nnoremap sQ :<C-u>q<CR>

" switch tab
nmap <Tab> gt
nmap <S-Tab> gT

" change buf size
nnoremap <S-Left>  <C-w>>CR>
nnoremap <S-Right> <C-w><<CR>
nnoremap <S-Up>    <C-w>-<CR>
nnoremap <S-Down>  <C-w>+<CR>
