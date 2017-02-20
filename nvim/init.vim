scriptencoding utf-8

let g:python3_host_prog = '/usr/local/bin/python3'
if has('multi_lang')
  language C
endif

" -----
" Base Setting

set notimeout ttimeout timeoutlen=100
set history=100
set nobackup
set noswapfile
set clipboard+=unnamedplus
set confirm
set autoread

set imdisable

" search
set ignorecase
set smartcase
set hlsearch
set incsearch

" indent
set tabstop=2
set shiftwidth=2
set expandtab
set softtabstop=2
set autoindent
set smartindent

set backspace=indent,eol,start
set list
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%
set showbreak=↪
set number
set wildmenu
set wildmode=longest,full
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.jpg,*.png
set wrap
set showtabline=2
set laststatus=2
" show too long line
set display=lastline

" 対応する括弧を表示
set showmatch
set matchtime=1
set matchpairs+=「:」,『:』,（:）,【:】,《:》,〈:〉,［:］,‘:’,“:”

set t_co=<t_co>
set pastetoggle=<C-q>

set completeopt=menuone

" -----
" vim-plug
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')
Plug 'nixprime/cpsm', { 'dir': '~/.local/share/nvim/plugged/cpsm/', 'do': 'env PY3=ON ./install.sh' }
Plug 'ctrlpvim/ctrlp.vim'
  Plug 'mattn/ctrlp-filer'
  Plug 'ompugao/ctrlp-history'
  Plug 'endel/ctrlp-filetype.vim'
  Plug 'lokikl/vim-ctrlp-ag'
  Plug 'lambdalisue/vim-gista'
  Plug 'lambdalisue/vim-gista-ctrlp'
Plug 'LeafCage/yankround.vim'
Plug 'editorconfig/editorconfig-vim'
" Plug 'justinmk/vim-dirvish'
Plug 'cocopon/vaffle.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
Plug 'kana/vim-submode'
Plug 'kana/vim-textobj-user'
  Plug 'kana/vim-textobj-entire'
  Plug 'kana/vim-textobj-indent'
  Plug 'kana/vim-textobj-datetime'
  Plug 'osyo-manga/vim-textobj-multiblock'
  Plug 'mattn/vim-textobj-url'
  Plug 'thinca/vim-textobj-between'
Plug 'kana/vim-operator-user'
  Plug 'kana/vim-operator-replace'
  Plug 'rhysd/vim-operator-surround'
  Plug 'thinca/vim-operator-sequence'
Plug 't9md/vim-quickhl'
Plug 'tyru/caw.vim'
Plug 'w0ng/vim-hybrid'
Plug 'chrismccord/bclose.vim'
Plug 'easymotion/vim-easymotion'
" visual
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'
" deo
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/context_filetype.vim'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'Shougo/neosnippet'
" syntax
Plug 'osyo-manga/vim-monster', { 'for': 'ruby' }
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript.jsx' }
Plug 'mxw/vim-jsx', { 'for': 'javascript.jsx' }
Plug 'moll/vim-node', { 'for': 'node' }
Plug 'digitaltoad/vim-pug', { 'for': ['slim', 'jade', 'pug'] }
Plug '5t111111/neat-json.vim', { 'for': 'json' }
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }
Plug 'cespare/vim-toml', {'for': 'toml' }
call plug#end()

" -----
" filetype IndentSettings

augroup Indent
  autocmd!
  " common indent
  autocmd FileType ruby,yaml,eruby,coffee,javascript,go,html,css setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2

  "Coffee script
  autocmd BufRead,BufNewFile *.coffee set filetype=coffee
  autocmd BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab
  "node / js
  autocmd BufRead,BufNewFile *.js set filetype=javascript.jsx
  autocmd BufNewFile,BufReadPost *.js setl shiftwidth=2 expandtab
  "Cakefile
  autocmd BufRead,BufNewFile Cakefile set filetype=coffee
  autocmd BufNewFile,BufReadPost Cakefile setl shiftwidth=2 expandtab
  "Go
  autocmd BufRead,BufNewFile *.go set filetype=go
  autocmd BufNewFile,BufReadPost *.go setl shiftwidth=2 expandtab
  "Markdown
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile GHI_ISSUE set filetype=markdown
  "HTML
  autocmd BufRead,BufNewFile *.html set filetype=html
  autocmd BufNewFile,BufReadPost *.html setl shiftwidth=2 expandtab
  "Jade -> slim
  autocmd BufNewFile,BufRead *.jade set filetype=pug
  "CSS
  autocmd BufRead,BufNewFile *.css set filetype=css
  autocmd BufNewFile,BufReadPost *.css setl shiftwidth=2 expandtab

  " list chars color
  autocmd VimEnter,Colorscheme * highlight SpecialKey term=bold ctermfg=241
augroup END

filetype plugin indent on

" syntax option
set regexpengine=1
syntax enable
syntax on

augroup Buffer
  autocmd!
  " auto Trailing WhiteSpace
  autocmd BufWritePre * :%s/\s\+$//e
  " カーソル復元
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

" 全角スペースをハイライト表示
function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=reverse ctermfg=lightblue gui=reverse guifg=DarkMagenta
endfunction

if has('syntax')
  augroup TatsuroroHighlihgt
    autocmd!
    autocmd ColorScheme * highlight Search ctermfg=139 ctermbg=none
    autocmd ColorScheme * call ZenkakuSpace()
    autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
  augroup END
  call ZenkakuSpace()
endif

" 日本語入力をリセット
au BufNewFile,BufRead * set iminsert=0

" カラースキーム
if has('nvim')
  let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif

set background=dark
colorscheme hybrid
let g:hybrid_use_iTerm_colors = 0

" 行番号の色を設定
set cursorline
hi LineNr ctermbg=235 ctermfg=241
hi CursorLineNr ctermbg=4 ctermfg=0
hi clear CursorLine
hi CursorLine ctermbg=236


" -----
" Plugin settings

" quickrun
let g:quickrun_config = {
  \   '_' : {
  \       'outputter/buffer/split' : ':botright',
  \       'outputter/buffer/close_on_empty' : 1
  \   },
  \}

" ctrlp
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_extensions = ['root', 'mixed']
let g:ctrlp_match_func = {'match': 'cpsm#CtrlPMatch'}
let g:ctrlp_match_window = 'bottom,min:1,max:30'
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/](node_modules|tmp|temp|\.(git|hg|hgn|svn))$',
  \ 'file': '\v\.(exe|so|dll|png|jpg|gif)$',
  \ 'link': '',
  \ }
let g:ctrlp_max_files = 100000
let g:ctrlp_max_depth = 40
" use mattn/files for file list (need to `go install mattn/files`)
let g:ctrlp_user_command = 'files -a -i "^(.git|node_modules)$" %s'
let g:ctrlp_prompt_mappings = { 'PrtExit()': ['<ESC>', '<c-g>', '<c-c>', '<c-q>'] }
let g:ctrlp_root_markers = ['.git', 'package.json', 'Gemfile', 'build.xml']

" vim-easymotion
" Disable default mappings
let g:EasyMotion_do_mapping = 0

" Jump to first match with enter & space
let g:EasyMotion_enter_jump_first = 1
let g:EasyMotion_space_jump_first = 1

" vim-gista
let g:gista#client#default_username = 'tatsuroro'

" jsファイルで jsx シンタックスを有効にする
let g:jsx_ext_required = 0

" vim-airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" indentLine
let g:indentLine_enabled = 0
let g:indentLine_color_term = 241
let g:indentLine_color_gui = '#eeeeee'
let g:indentLine_char = '¦' "use ¦, ┆ or │


" deoplete
let g:deoplete#enable_at_startup = 1
runtime! plugins/deoplete.rc.vim

" Set async completion. With deoplete.nvim
let g:monster#completion#rcodetools#backend = 'async_rct_complete'
let g:deoplete#sources#omni#input_patterns = {
\   'ruby' : '[^. *\t]\.\w*\|\h\w*::',
\}

" -----
" Commmands

" vp doesn't replace paste buffer
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction
function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()

" sudo save
cabbr w!! w !sudo tee > /dev/null %

" -----
" Keymaps

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

""" yankround
nmap p <Plug>(yankround-p)
xmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap gp <Plug>(yankround-gp)
xmap gp <Plug>(yankround-gp)
nmap gP <Plug>(yankround-gP)
nmap <C-j> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)

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
" ctrlp-yankround
nnoremap <silent><C-y> :<C-u>CtrlPYankRound<CR>
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
