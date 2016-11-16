let g:python3_host_prog = '/usr/local/bin/python3'
if has("multi_lang")
  language C
endif

" set encoding=utf-8
" set fileencodings=default,euc-jp,sjis,utf-8
" set fileformats=unix,dos,mac

"dein Scripts-----------------------------
if &compatible
  set nocompatible   " Be iMproved
endif

" Required:
set runtimepath^=$HOME/src/github.com/Shougo/dein.vim
let s:dein_dir = expand('~/.cache/dein')

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " Add or remove your plugins here:
  let g:rc_dir = expand('~/.config/nvim')
  let s:toml = g:rc_dir . '/.dein.toml'
  let s:lazy_toml = g:rc_dir . '/.dein_lazy.toml'

  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif
"End dein Scripts-------------------------

""" Base Setting

set notimeout ttimeout timeoutlen=100
set history=100
set nobackup
set noswapfile
set clipboard+=unnamedplus
set confirm
set autoread

set imdisable

set backspace=indent,eol,start
set list
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%

" showbreaks
set showbreak=↪

" show too long line
set display=lastline

" ui
set number
set wildmenu
set wildmode=longest,full
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.jpg,*.png
set wrap
set showtabline=2
set laststatus=2

" search
set ignorecase
set smartcase
set hlsearch
set incsearch
" 対応する括弧を表示
set showmatch
set matchtime=1
set matchpairs+=「:」,『:』,（:）,【:】,《:》,〈:〉,［:］,‘:’,“:”

set t_co=<t_co>

" indent
set pastetoggle=<C-q>

set tabstop=2
set shiftwidth=2
set expandtab
set softtabstop=2

set autoindent
set smartindent

set completeopt=menuone

""" filetype IndentSettings
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
  autocmd BufNewFile,BufRead *.jade set filetype=slim
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

"-------------------------------------------------
"  Settings / autoCmd
"-------------------------------------------------

""" emmet
let g:user_emmet_leader_key='<C-m>'
let g:use_emmet_complete_tag = 1

""" quickrun
let g:quickrun_config = {
  \   "_" : {
  \       "outputter/buffer/split" : ":botright",
  \       "outputter/buffer/close_on_empty" : 1
  \   },
  \}

""" ctrlp
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_extensions = ['mixed']
let g:ctrlp_match_func = {'match': 'cpsm#CtrlPMatch'}
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:18'
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/](node_modules|\.(git|hg|hgn|svn))$',
  \ 'file': '\v\.(exe|so|dll|png|jpg|gif)$',
  \ 'link': '',
  \ }
let g:ctrlp_max_files = 100000
let g:ctrlp_max_depth = 40
let g:ctrlp_user_command = 'files -a -i "^(.git|node_modules)$" %s'

""" vim-easymotion
"Disable default mappings
let g:EasyMotion_do_mapping = 0

" Jump to first match with enter & space
let g:EasyMotion_enter_jump_first = 1
let g:EasyMotion_space_jump_first = 1

""" vim-gista
let g:gista#client#default_username = 'tatsuroro'

" jsファイルで jsx シンタックスを有効にする
let g:jsx_ext_required = 0

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

""" vim-airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

""" indentLine
let g:indentLine_color_term = 241
let g:indentLine_color_gui = '#eeeeee'
let g:indentLine_char = '¦' "use ¦, ┆ or │

" Set async completion. With deoplete.nvim
let g:monster#completion#rcodetools#backend = "async_rct_complete"
let g:deoplete#sources#omni#input_patterns = {
\   "ruby" : '[^. *\t]\.\w*\|\h\w*::',
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

" sudo save"
cabbr w!! w !sudo tee > /dev/null %

"-------------------------------------------------
"  Keymaps
"-------------------------------------------------

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

" leader + cで行の先頭にコメントをつけたり外したりできる
nmap <Leader>c <Plug>(caw:i:toggle)
vmap <Leader>c <Plug>(caw:i:toggle)

""" vimshell shortcuts
" ,is: シェルを起動
nnoremap <silent> ,is :VimShell<CR>
" ,ipy: pythonを非同期で起動
nnoremap <silent> ,ipy :VimShellInteractive python<CR>
" ,irb: irbを非同期で起動
nnoremap <silent> ,irb :VimShellInteractive irb<CR>
" ,ss: 非同期で開いたインタプリタに現在の行を評価させる
vmap <silent> ,ss :VimShellSendString<CR>
" 選択中に,ss: 非同期で開いたインタプリタに選択行を評価させる
nnoremap <silent> ,ss <S-v>:VimShellSendString<CR>

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

""" Denite
nnoremap [denite] <Nop>
nmap <Leader>f [denite]

nnoremap [denite]u  :<C-u>Denite -no-split<Space>
nnoremap <silent> [denite]f :<C-u>Denite file_rec<CR>
nnoremap <silent> [denite]b :<C-u>Denite buffer<CR>
nnoremap <silent> [denite]l :<C-u>Denite line<CR>
nnoremap <silent> [denite]m :<C-u>Denite file_mru<CR>
nnoremap <silent> <C-k> :<C-u>Denite file_mru<CR>
nnoremap <silent> [denite]y :<C-u>Denite neoyank<CR>
nnoremap <silent> [denite]h :<C-u>Denite help<CR>
nnoremap <silent> [denite]a :<C-u>Denite buffer file_mru<CR>

" Denite grep検索
nnoremap <silent> ,g  :<C-u>Denite grep:. -buffer-name=search-buffer<CR>
" カーソル位置の単語をgrep検索
nnoremap <silent> ,mg :<C-u>Denite grep:. -buffer-name=search-buffer<CR><C-R><C-W><CR>
" grep検索結果の再呼出
nnoremap <silent> ,r  :<C-u>DeniteResume search-buffer<CR>

""" neosnippet
" Plugin key-mappings.
imap <C-j> <Plug>(neosnippet_expand_or_jump)
smap <C-j> <Plug>(neosnippet_expand_or_jump)
xmap <C-j> <Plug>(neosnippet_expand_target)

""" vim-gista-ctrlp
nnoremap <silent> <C-g> :CtrlPGista<CR>

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

""" textobj-multiblock
omap ab <Plug>(textobj-multiblock-a)
omap ib <Plug>(textobj-multiblock-i)
vmap ab <Plug>(textobj-multiblock-a)
vmap ib <Plug>(textobj-multiblock-i)

""" vim-quickhl
nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)
nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-resetl)l

" for masui special. 編集箇所を戻る
noremap g<CR> g;

" qでウインドウを閉じて Qでマクロ
nnoremap Q q

""" vim-easymotion
nmap q <Plug>(easymotion-s2)
xmap q <Plug>(easymotion-s2)
" surround.vimと被らないように
omap q <Plug>(easymotion-s2)

""" -----
""" Move Setting

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
