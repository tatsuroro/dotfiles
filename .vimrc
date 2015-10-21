set nocompatible
set notimeout
set ttimeout
set timeoutlen=100
set history=100
set nobackup
set noswapfile
set clipboard+=autoselect

set autoread

set imdisable

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
set incsearch

set showmatch "対応する括弧を表示

" カーソル復元
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" Ruby
autocmd FileType ruby setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
" YAML
autocmd FileType yaml setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
" ERUBY
autocmd FileType eruby setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
" HAML
autocmd FileType haml setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2

" CoffeeScript, JavaScript
autocmd FileType coffee,javascript setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab


"Coffee script
au BufRead,BufNewFile *.coffee set filetype=coffee
au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab
autocmd FileType coffee setlocal sw=2 sts=2 ts=2 et

"node
au BufRead,BufNewFile *.js set filetype=node
au BufNewFile,BufReadPost *.js setl shiftwidth=2 expandtab
autocmd FileType node setlocal sw=2 sts=2 ts=2 et

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


filetype indent on
filetype plugin on

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

if !has('gui_running')
  set t_co=256
endif

filetype plugin indent off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle'))
endif 

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
    \ 'windows' : 'make -f make_mingw32.mak',
    \ 'cygwin' : 'make -f make_cygwin.mak',
    \ 'mac' : 'make -f make_mac.mak',
    \ 'unix' : 'make -f make_unix.mak',
  \ },
\ }
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/neomru.vim'
" NeoBundle 'Shougo/vimfiler'
NeoBundle 'thinca/vim-unite-history'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'chrismccord/bclose.vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tyru/caw.vim'
NeoBundle 'rking/ag.vim'
NeoBundle 'kana/vim-submode'
NeoBundle 'tpope/vim-rails'
NeoBundle 'elixir-lang/vim-elixir'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'mxw/vim-jsx'
NeoBundle 'moll/vim-node'
NeoBundle '5t111111/neat-json.vim'
NeoBundle 'dgryski/vim-godef'
NeoBundle 'vim-jp/vim-go-extra'
NeoBundle 'cakebaker/scss-syntax.vim'
NeoBundle 'dterei/VimCobaltColourScheme'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'jonathanfilip/vim-lucius'

" if_luaが有効ならneocompleteを使う
NeoBundle has('lua') ? 'Shougo/neocomplete' : 'Shougo/neocomplcache'

if neobundle#is_installed('neocomplete')
  " neocomplete用設定
  let g:neocomplete#enable_at_startup = 1
  let g:neocomplete#enable_ignore_case = 1
  let g:neocomplete#enable_smart_case = 1
  if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
  let g:neocomplete#keyword_patterns._ = '\h\w*'
elseif neobundle#is_installed('neocomplcache')
  " neocomplcache用設定
  let g:neocomplcache_enable_at_startup = 1
  let g:neocomplcache_enable_ignore_case = 1
  let g:neocomplcache_enable_smart_case = 1
  if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
  let g:neocomplcache_keyword_patterns._ = '\h\w*'
  let g:neocomplcache_enable_camel_case_completion = 1
  let g:neocomplcache_enable_underbar_completion = 1
endif
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

" quickrun
let g:quickrun_config = {
  \   "_" : {
  \       "outputter/buffer/split" : ":botright",
  \       "outputter/buffer/close_on_empty" : 1
  \   },
  \}

" Unite Setting
" let g:unite_enable_start_insert = 1
let g:unite_split_rule = 'rightbelow'
let g:unite_winwidth = 40
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200

" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q

" grep検索
nnoremap <silent> ,g  :<C-u>Unite grep:. -buffer-name=search-buffer<CR>

" カーソル位置の単語をgrep検索
nnoremap <silent> ,cg :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>

" unite grep に ag(The Silver Searcher) を使う
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif


filetype plugin indent on

let g:syntastic_check_on_open = 1
let g:syntastic_mode_map = { 'mode': 'passive',
    \ 'active_filetypes': ['ruby'] }
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_enable_signs = 1
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'

let g:jsx_ext_required = 0

" lightline
let g:lightline = {
  \ 'colorscheme': 'wombat',
  \ 'component': {
  \   'readonly': '%{&readonly?"":""}',
  \ },
  \ 'separator': { 'left': '', 'right': '' },
  \ 'subseparator': { 'left': '', 'right': '' }
  \ }

" カラースキーム
let g:hybrid_use_iTerm_colors = 0
let g:lucius_no_term_bg = 1
colorscheme hybrid
syntax enable
syntax on

set background=dark

" IndentGuide Setting
hi IndentGuidesOdd  ctermbg=8
hi IndentGuidesEven ctermbg=236
let g:indent_guides_auto_colors = 1
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 1
" let g:indent_guides_guide_size = 1


""" Commmands

" TODOファイル
command! Todo edit ~/Dropbox/memo/todo.txt

" 一時ファイル
command! -nargs=1 -complete=filetype Tmp edit ~/.vim_tmp/tmp.<args>
command! -nargs=1 -complete=filetype Temp edit ~/.vim_tmp/tmp.<args>>>"


"-------------------------------------------------
"  Keymaps
"-------------------------------------------------

" set Leader
let mapleader = "\<Space>"

" disable ex mode
nnoremap Q <Nop>
" disable shortcut exit without save
nnoremap ZQ <Nop>

" vv -> select to lineEnd
vnoremap v $h

" delete buffer without close split view
nmap <C-W>w <Plug>Bclose

" leader + cで行の先頭にコメントをつけたり外したりできる
nmap <Leader>c <Plug>(caw:i:toggle)
vmap <Leader>c <Plug>(caw:i:toggle)

" replace for easy input
noremap <Leader>h  ^
noremap <Leader>l  $
nnoremap <Leader>/  *
noremap <Leader>m  %

""" nerdTree
noremap <Leader>e :NERDTreeToggle<CR>

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

""" unite
nnoremap [unite] <Nop>
nmap <Leader>f [unite]

nnoremap [unite]u  :<C-u>Unite -no-split<Space>
nnoremap <silent> [unite]f :<C-u>Unite<Space>buffer<CR>
nnoremap <silent> [unite]b :<C-u>Unite<Space>bookmark<CR>
nnoremap <silent> [unite]m :<C-u>Unite<Space>file_mru<CR>
nnoremap <silent> [unite]r :<C-u>UniteWithBufferDir file<CR>
nnoremap <silent> ,vr :UniteResume<CR>
 
" unite-build map
nnoremap <silent> ,vb :Unite build<CR>
nnoremap <silent> ,vcb :Unite build:!<CR>
nnoremap <silent> ,vch :UniteBuildClearHighlight<CR>

" unite outline
nnoremap <Leader>o :Unite -vertical -no-quit -winwidth=32 outline<CR>

""" function keys

nnoremap <F10> :VimFiler<CR>
nnoremap <F11> :UniteBookmarkAdd<CR>
nnoremap <F12> :Unite bookmark<CR>

""" Move Setting

" insert mode での移動
inoremap <C-e> <END>
inoremap <C-a> <HOME>

" 左右のカーソル移動で行間移動可能にする。
set whichwrap=b,s,<,>,[,]

" タブ切り替え
nmap <Tab> gt
nmap <S-Tab> gT

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
nnoremap sn gt
nnoremap sp gT
nnoremap sr <C-w>r
nnoremap s= <C-w>=
nnoremap so <C-w>_<C-w>|
nnoremap sO <C-w>=
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
nnoremap st :<C-u>tabnew<CR>
nnoremap sT :<C-u>Unite tab<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>
nnoremap sb :<C-u>Unite buffer_tab -buffer-name=file<CR>
nnoremap sB :<C-u>Unite buffer -buffer-name=file<CR>

call submode#enter_with('bufmove', 'n', '', 's>', '<C-w>>')
call submode#enter_with('bufmove', 'n', '', 's<', '<C-w><')
call submode#enter_with('bufmove', 'n', '', 's+', '<C-w>+')
call submode#enter_with('bufmove', 'n', '', 's-', '<C-w>-')
call submode#map('bufmove', 'n', '', '>', '<C-w>>')
call submode#map('bufmove', 'n', '', '<', '<C-w><')
call submode#map('bufmove', 'n', '', '+', '<C-w>+')
call submode#map('bufmove', 'n', '', '-', '<C-w>-')

