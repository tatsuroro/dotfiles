scriptencoding utf-8

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
" filetype IndentSettings

augroup Indent
  autocmd!
  " common indent
  autocmd FileType ruby,yaml,eruby,coffee,typescript,javascript,go,html,css,json setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2

  "Coffee script
  autocmd BufRead,BufNewFile *.coffee set filetype=coffee
  "TypeScript
  autocmd BufRead,BufNewFile *.ts set filetype=typescript
  autocmd BufRead,BufNewFile *.tsx set filetype=typescript.tsx
  "node / js
  autocmd BufRead,BufNewFile *.js set filetype=javascript.jsx
  autocmd BufRead,BufNewFile *.jsx set filetype=jsx
  "Cakefile
  autocmd BufRead,BufNewFile Cakefile set filetype=coffee
  "Go
  autocmd BufRead,BufNewFile *.go set filetype=go
  "Markdown
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile GHI_ISSUE set filetype=markdown
  "HTML
  autocmd BufRead,BufNewFile *.html set filetype=html
  "Jade -> slim
  autocmd BufNewFile,BufRead *.jade set filetype=pug
  "CSS
  autocmd BufRead,BufNewFile *.css set filetype=css
  "TSV
  autocmd BufRead,BufNewFile *.tsv set filetype=tsv
  autocmd FileType tsv, setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4

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
" Commmands

" sudo save
cabbr w!! w !sudo tee > /dev/null %

