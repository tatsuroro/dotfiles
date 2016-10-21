let g:python3_host_prog = '/usr/local/bin/python3'
if has("multi_lang")
  language C
endif

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

" 文字、改行コードを自動判別する
" set encoding=utf-8
" set fileencodings=default,euc-jp,sjis,utf-8
" set fileformats=unix,dos,mac

set autoread

set imdisable

set backspace=indent,eol,start
set list
set listchars=tab:»-,trail:*,extends:»,precedes:«,nbsp:%
" showbreaks
set showbreak=↪

" ui
set number cursorline
set showmatch
set wildmenu
set wildmode=longest,full
set wrap
set showtabline=2
set laststatus=2

" search
set ignorecase
set smartcase

set hlsearch
set incsearch

set showmatch "対応する括弧を表示

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
" Ruby
autocmd FileType ruby setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
" YAML
autocmd FileType yaml setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
" ERUBY
autocmd FileType eruby setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
" CoffeeScript, JavaScript
autocmd FileType coffee,javascript setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab

"Coffee script
au BufRead,BufNewFile *.coffee set filetype=coffee
au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab
autocmd FileType coffee setlocal sw=2 sts=2 ts=2 et

"node / js
au BufRead,BufNewFile *.js set filetype=javascript.jsx
au BufNewFile,BufReadPost *.js setl shiftwidth=2 expandtab
autocmd FileType javascript setlocal sw=2 sts=2 ts=2 et

"Cakefile
au BufRead,BufNewFile Cakefile set filetype=coffee
au BufNewFile,BufReadPost Cakefile setl shiftwidth=2 expandtab
autocmd FileType coffee setlocal sw=2 sts=2 ts=2 et

"Go
au BufRead,BufNewFile *.go set filetype=go
au BufNewFile,BufReadPost *.go setl shiftwidth=2 expandtab
autocmd FileType go setlocal sw=2 sts=2 ts=2 et

"Markdown
au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile GHI_ISSUE set filetype=markdown

"HTML
au BufRead,BufNewFile *.html set filetype=html
au BufNewFile,BufReadPost *.html setl shiftwidth=2 expandtab
autocmd FileType html setlocal sw=2 sts=2 ts=2 et

"Jade -> slim
autocmd BufNewFile,BufRead *.jade set filetype=slim

"CSS
au BufRead,BufNewFile *.css set filetype=css
au BufNewFile,BufReadPost *.css setl shiftwidth=2 expandtab
autocmd FileType css setlocal sw=2 sts=2 ts=2 et

filetype plugin indent on

" syntax option
set regexpengine=1
syntax enable
syntax on

" auto Trailing WhiteSpace
autocmd BufWritePre * :%s/\s\+$//e

" カーソル復元
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" 全角スペースをハイライト表示
function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=reverse ctermfg=lightblue gui=reverse guifg=DarkMagenta
endfunction

if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    autocmd ColorScheme       * call ZenkakuSpace()
    autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
  augroup END
  call ZenkakuSpace()
endif

" 日本語入力をリセット
au BufNewFile,BufRead * set iminsert=0

"-------------------------------------------------
"  Settings / autoCmd
"-------------------------------------------------

" emmet
let g:user_emmet_leader_key='<C-m>'
let g:use_emmet_complete_tag = 1

""" quickrun
let g:quickrun_config = {
  \   "_" : {
  \       "outputter/buffer/split" : ":botright",
  \       "outputter/buffer/close_on_empty" : 1
  \   },
  \}

""" Unite Setting
let g:unite_enable_start_insert = 1
" let g:unite_split_rule = 'rightbelow'
let g:unite_winwidth = 40
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200

" unite.vim上でのキーマッピング
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
  " ESCキーを2回押すと終了する
  nmap <silent><buffer> <ESC><ESC> q
  imap <silent><buffer> <ESC><ESC> <ESC>q
endfunction

" unite keymapping
autocmd FileType unite call s:unite_my_keymappings()
function! s:unite_my_keymappings()
  " fを押下でカーソル下の候補を選択状態にする
  nmap <buffer> f <Plug>(unite_toggle_mark_current_candidate)
endfunction

" unite grep に ag(The Silver Searcher) を使う
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --line-numbers --hidden --ignore ''.git'''
  let g:unite_source_grep_recursive_opt = ''
  let g:unite_source_grep_max_candidates = 200
endif

let g:unite_source_menu_menus = {
\   "shortcut" : {
\       "description" : "sample unite-menu",
\       "command_candidates" : [
\           ["edit vimrc", "edit $MYVIMRC"],
\           ["unite-file_mru", "Unite file_mru"],
\           ["Unite Beautiful Attack", "Unite -auto-preview colorscheme"],
\           ["unite-output:message", "Unite output:message"],
\       ],
\   },
\}

""" vimfiler
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_enable_auto_cd = 1
autocmd FileType vimfiler nmap <buffer> <CR> <Plug>(vimfiler_cd_or_edit)

""" ctrlp
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_extensions = ['mixed']
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:18'
let g:ctrlp_custom_ignore = '\v[\/](node_modules|\.git|\.hgn)$'
let g:ctrlp_max_files = 100000
let g:ctrlp_max_depth = 40

" jsファイルで jsx シンタックスを有効にする
let g:jsx_ext_required = 0

" カラースキーム
if has('nvim')
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

set background=dark
colorscheme hybrid
let g:hybrid_use_iTerm_colors = 0

" 行番号の色を設定
hi LineNr ctermbg=0 ctermfg=235
hi CursorLineNr ctermbg=4 ctermfg=0
hi clear CursorLine

" vim-airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

""" IndentGuide Setting
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 2
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=233

" Set async completion. With deoplete.nvim
let g:monster#completion#rcodetools#backend = "async_rct_complete"
let g:deoplete#sources#omni#input_patterns = {
\   "ruby" : '[^. *\t]\.\w*\|\h\w*::',
\}


""" Commmands

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

"-------------------------------------------------
"  Keymaps
"-------------------------------------------------

" set Leader
let mapleader = "\<Space>"

" disable ex mode
nnoremap Q <Nop>
" disable shortcut exit without save
nnoremap ZQ <Nop>

" set us mode
nnoremap : ;
nnoremap ; :
vnoremap : ;
vnoremap ; :

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

""" unite
nnoremap [unite] <Nop>
nmap <Leader>f [unite]

nnoremap [unite]u  :<C-u>Unite -no-split<Space>
nnoremap <silent> [unite]f :<C-u>Unite<Space>file<CR>
nnoremap <silent> [unite]b :<C-u>Unite<Space>buffer<CR>
nnoremap <silent> [unite]t :<C-u>Unite<Space>tab<CR>
nnoremap <silent> [unite]k :<C-u>Unite<Space>bookmark<CR>
nnoremap <silent> [unite]m :<C-u>Unite<Space>file_mru<CR>
nnoremap <silent> [unite]a :<C-u>Unite buffer file file_mru bookmark<CR>
nnoremap <silent> [unite]p :<C-u>Unite<Space>register<CR>
nnoremap <silent> [unite]d :<C-u>UniteWithBufferDir file<CR>
nnoremap <silent> [unite]r :<C-u>UniteResume<CR>

" grep検索
nnoremap <silent> ,g  :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
" カーソル位置の単語をgrep検索
nnoremap <silent> ,cg :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>
" ディレクトリを指定してgrep検索
nnoremap <silent> ,dg  :<C-u>Unite grep -buffer-name=search-buffer<CR>
" grep検索結果の再呼出
nnoremap <silent> ,r  :<C-u>UniteResume search-buffer<CR>

" unite outline
nnoremap <Leader>o :Unite -vertical -no-quit -winwidth=32 outline<CR>

""" vimfiler
noremap <C-K> :VimFilerExplorer -simple -winwidth=26 -no-quit<CR>

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

""" function keys
nnoremap <F10> :VimFiler<CR>

""" neosnippet
" Plugin key-mappings.
imap <C-j>     <Plug>(neosnippet_expand_or_jump)
smap <C-j>     <Plug>(neosnippet_expand_or_jump)
xmap <C-j>     <Plug>(neosnippet_expand_target)

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

""" textobj-multiblock
omap ab <Plug>(textobj-multiblock-a)
omap ib <Plug>(textobj-multiblock-i)
vmap ab <Plug>(textobj-multiblock-a)
vmap ib <Plug>(textobj-multiblock-i)

" タブ切り替え
nmap <Tab> gt
nmap <S-Tab> gT

call submode#enter_with('bufmove', 'n', '', 's>', '<C-w>>')
call submode#enter_with('bufmove', 'n', '', 's<', '<C-w><')
call submode#enter_with('bufmove', 'n', '', 's+', '<C-w>+')
call submode#enter_with('bufmove', 'n', '', 's-', '<C-w>-')
call submode#map('bufmove', 'n', '', '>', '<C-w>>')
call submode#map('bufmove', 'n', '', '<', '<C-w><')
call submode#map('bufmove', 'n', '', '+', '<C-w>+')
call submode#map('bufmove', 'n', '', '-', '<C-w>-')
