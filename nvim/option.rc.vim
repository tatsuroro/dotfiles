" auto detect character code
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
set fileformats=unix,dos,mac

scriptencoding utf-8

set notimeout ttimeout timeoutlen=100
set history=100
set nobackup
set noswapfile
set clipboard+=unnamedplus
set confirm
set autoread

" switch buffer without save
set hidden

set imdisable

" search
set ignorecase
set smartcase
set hlsearch
set incsearch
set wrap

" indent
set tabstop=2
set shiftwidth=2
set expandtab
set softtabstop=2
set autoindent
set smartindent

" display
set backspace=indent,eol,start
set number
set ruler
set list
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%
set showcmd
set showbreak=↪
set wildmenu
set wildmode=longest,full
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.jpg,*.png
set showtabline=2
set laststatus=2
" show too long line
set display=lastline
" 対応する括弧を表示
set showmatch
set matchtime=1
set matchpairs+=「:」,『:』,（:）,【:】,《:》,〈:〉,［:］,‘:’,“:”
set t_co=<t_co>
set background=dark

" colorscheme
colorscheme hybrid
let g:hybrid_use_iTerm_colors = 0
if has('nvim')
  let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif

" 行番号の色を設定
set cursorline
hi LineNr ctermbg=235 ctermfg=241
hi CursorLineNr ctermbg=4 ctermfg=0
hi clear CursorLine
hi CursorLine ctermbg=236

set pastetoggle=<C-q>

set completeopt=menuone

" syntax option
set regexpengine=1
syntax enable
syntax on

augroup Indent
  autocmd!
  " common indent
  autocmd FileType ruby       setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
  autocmd FileType yaml       setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
  autocmd FileType eruby      setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
  autocmd FileType coffee     setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
  autocmd FileType typescript setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
  autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
  autocmd FileType go         setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
  autocmd FileType html       setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
  autocmd FileType css        setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
  autocmd FileType json       setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
  autocmd FileType tsv        setlocal tabstop=4 shiftwidth=4 softtabstop=4 noexpandtab

  autocmd BufRead,BufNewFile *.coffee  set filetype=coffee
  autocmd BufRead,BufNewFile *.ts      set filetype=typescript
  autocmd BufRead,BufNewFile *.tsx     set filetype=typescript.tsx
  autocmd BufRead,BufNewFile *.js      set filetype=javascript.jsx
  autocmd BufRead,BufNewFile *.jsx     set filetype=jsx
  autocmd BufRead,BufNewFile Cakefile  set filetype=coffee
  autocmd BufRead,BufNewFile *.go      set filetype=go
  autocmd BufRead,BufNewFile *.md      set filetype=markdown
  autocmd BufRead,BufNewFile GHI_ISSUE set filetype=markdown
  autocmd BufRead,BufNewFile *.html    set filetype=html
  autocmd BufNewFile,BufRead *.jade    set filetype=pug
  autocmd BufRead,BufNewFile *.css     set filetype=css
  autocmd BufRead,BufNewFile *.tsv     set filetype=tsv
  autocmd Bufread,BufNewFile *key.md   set filetype=markdown.slide
augroup END

augroup Format
  autocmd!
  autocmd FileType javascript.jsx set formatprg=prettier\ --stdin\ --single-quote\ --parser\ flow\ --trailing-comma\ es5
  autocmd FileType typescript.tsx set formatprg=tsfmt\
  autocmd FileType typescript set formatprg=tsfmt\
augroup END

augroup Buffer
  autocmd!
  " auto Trailing WhiteSpace
  autocmd BufWritePre * :%s/\s\+$//e
  " auto format
  autocmd BufWritePre *.js Neoformat
  autocmd BufWritePre *.jsx Neoformat
  " カーソル復元
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

" 全角スペースをハイライト表示
function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=reverse ctermfg=lightblue gui=reverse guifg=DarkMagenta
endfunction

if has('syntax')
  augroup Highlihgt
    autocmd!
    autocmd ColorScheme * highlight Search ctermfg=139 ctermbg=none
    autocmd ColorScheme * call ZenkakuSpace()
    autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
    " list chars color
    autocmd VimEnter,Colorscheme * highlight SpecialKey term=bold ctermfg=241
  augroup END

  call ZenkakuSpace()
endif

" disable IME
au BufNewFile,BufRead * set iminsert=0

" -----
" Commmands

" sudo save
cabbr w!! w !sudo tee > /dev/null %
