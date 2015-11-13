""" Bundles
if has('vim_starting')
  if &compatible
    set nocompatible
  endif

  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
    \ 'mac' : 'make -f make_mac.mak',
    \ 'unix' : 'make -f make_unix.mak',
  \ },
\ }
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'thinca/vim-unite-history'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'bling/vim-airline'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'junegunn/vim-easy-align'
NeoBundle 'chrismccord/bclose.vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tyru/caw.vim'
NeoBundle 'kana/vim-submode'
" syntax
NeoBundle 'tpope/vim-rails'
NeoBundle 'elixir-lang/vim-elixir'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'mxw/vim-jsx'
NeoBundle 'moll/vim-node'
NeoBundle 'mattn/jscomplete-vim'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'myhere/vim-nodejs-complete'
NeoBundle '5t111111/neat-json.vim'
NeoBundle 'dgryski/vim-godef'
NeoBundle 'vim-jp/vim-go-extra'
NeoBundle 'othree/html5.vim'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'cakebaker/scss-syntax.vim'
" colorscheme
NeoBundle 'w0ng/vim-hybrid'

" if_luaが有効ならneocompleteを使う
NeoBundle has('lua') ? 'Shougo/neocomplete' : 'Shougo/neocomplcache'

call neobundle#end()

filetype plugin indent on
NeoBundleCheck

""" Base Setting

set nocompatible
set notimeout ttimeout timeoutlen=100
set history=100
set nobackup
set noswapfile
set clipboard+=autoselect
set confirm

" 文字、改行コードを自動判別する
:set encoding=utf-8
:set fileencodings=default,euc-jp,sjis,utf-8
:set fileformats=unix,dos,mac

set autoread

set imdisable

set backspace=indent,eol,start
set list
set listchars=tab:»-,trail:*,extends:»,precedes:«,nbsp:%

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

set t_co=256

" indent
set pastetoggle=<C-E>

set tabstop=2
set shiftwidth=2
set expandtab
set softtabstop=2

set autoindent
set smartindent

""" filetype IndentSettings
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

""" jscomplete / node-complete
:setl omnifunc=jscomplete#CompleteJS
if !exists('g:neocomplcache_omni_functions')
  let g:neocomplcache_omni_functions = {}
endif
let g:neocomplcache_omni_functions.javascript = 'nodejscomplete#CompleteJS'
let g:node_usejscomplete = 1

""" neocomplete
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

""" vimfiler
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_enable_auto_cd = 1
autocmd FileType vimfiler nmap <buffer> <CR> <Plug>(vimfiler_expand_or_edit)

""" Unite Setting
" let g:unite_enable_start_insert = 1
" let g:unite_split_rule = 'rightbelow'
let g:unite_winwidth = 40
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200

" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q

" unite grep に ag(The Silver Searcher) を使う
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --line-numbers --hidden --ignore ''.git'''
  let g:unite_source_grep_recursive_opt = ''
  let g:unite_source_grep_max_candidates = 200
endif

" open Unite file_mru on init
let file_name = expand("%:p")
if has('vim_starting') &&  file_name == ""
  autocmd VimEnter * execute ':Unite file_mru'
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

" unite keymapping
autocmd FileType unite call s:unite_my_keymappings()
function! s:unite_my_keymappings()
  " fを押下でカーソル下の候補を選択状態にする
  nmap <buffer> f <Plug>(unite_toggle_mark_current_candidate)
endfunction

""" syntastic
let g:syntastic_check_on_open = 1
let g:syntastic_mode_map = { 'mode': 'passive',
    \ 'active_filetypes': ['ruby'] }
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_enable_signs = 1
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'

" jsファイルで jsx シンタックスを有効にする
let g:jsx_ext_required = 0

" カラースキーム
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


""" Commmands

" TODOファイル
command! Todo edit ~/Dropbox/memo/todo.txt

" 一時ファイル
command! -nargs=1 -complete=filetype Tmp edit ~/.vim_tmp/tmp.<args>
command! -nargs=1 -complete=filetype Temp edit ~/.vim_tmp/tmp.<args>>>"

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

" Ctrl+d / Ctrl+l to Esc
inoremap <C-D> <Esc>
inoremap <C-L> <Esc>

" esc * 2 -> cancel search highlight
nnoremap <Esc><Esc> :nohlsearch<CR><Esc>

" Command Mode HistoryMove
inoremap <C-K> <Up>
inoremap <C-J> <Down>

" vv -> select to lineEnd
vnoremap v $h

" delete buffer without close split view
nmap <C-W>w <Plug>Bclose

" quick save
nnoremap <Leader>w :w<CR>

" leader + cで行の先頭にコメントをつけたり外したりできる
nmap <Leader>c <Plug>(caw:i:toggle)
vmap <Leader>c <Plug>(caw:i:toggle)

""" vimfiler
noremap <C-K> :VimFiler -split -simple -winwidth=26 -no-quit<CR>

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
nnoremap <Leader>ga :<C-u>Gwrite<CR>
nnoremap <Leader>gc :<C-u>Gcommit<CR>
nnoremap <Leader>gC :<C-u>Git commit --amend<CR>
nnoremap <Leader>gb :<C-u>Gblame<CR>

""" unite
nnoremap [unite] <Nop>
nmap <Leader>f [unite]

nnoremap [unite]u  :<C-u>Unite -no-split<Space>
nnoremap <silent> [unite]f :<C-u>Unite<Space>file<CR>
nnoremap <silent> [unite]b :<C-u>Unite<Space>buffer<CR>
nnoremap <silent> [unite]k :<C-u>Unite<Space>bookmark<CR>
nnoremap <silent> [unite]m :<C-u>Unite<Space>file_mru<CR>
nnoremap <silent> [unite]a :<C-u>Unite buffer file file_mru bookmark<CR>
nnoremap <silent> [unite]r :<C-u>Unite<Space>register<CR>
nnoremap <silent> [unite]d :<C-u>UniteWithBufferDir file<CR>
nnoremap <silent> [unite]p :<C-u>UniteResume<CR>

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

" easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

""" function keys

nnoremap <F10> :VimFiler<CR>
nnoremap <F11> :UniteBookmarkAdd<CR>

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
nnoremap sT :<C-u>Unite tab<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>bd<CR>
nnoremap sQ :<C-u>q<CR>

nnoremap sb :<C-u>Unite buffer_tab -buffer-name=file<CR>
nnoremap sB :<C-u>Unite buffer -buffer-name=file<CR>

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

