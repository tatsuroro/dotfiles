set encoding=utf-8

scriptencoding utf-8

if $SHELL =~? '/fish$'
  set shell=bash
endif

filetype plugin indent on

set notimeout ttimeout timeoutlen=100
set history=100
set nobackup
set noswapfile
set clipboard+=unnamed
set confirm
set autoread

" auto detect encoding and line delimiter
set fileencodings=default,utf-8,euc-jp,sjis
set fileformats=unix,dos,mac

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

" ui
set backspace=indent,eol,start
set number
set ruler
set list
set listchars=tab:»-,trail:*,extends:»,precedes:«,nbsp:%
set showcmd
set showbreak=↪
set wildmenu
set wildmode=longest,full
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.jpg,*.png
set showtabline=2
set laststatus=2
set display=lastline " show too long line
set showmatch " show pair-bracket
set matchtime=1
set matchpairs+=「:」,『:』,（:）,【:】,《:》,〈:〉,［:］,‘:’,“:”

set pastetoggle=<C-q>

set completeopt=menuone

""" MacVim Settings
if has('gui_macvim')
  set showtabline=2	" show
  set imdisable
  set transparency=10
  set antialias
  set guifont=Source\ Code\ Pro\ for\ Powerline:h16
  colorscheme iceberg
endif

if has('gui_running')
  set fuoptions=maxvert,maxhorz

  augroup Gui
    autocmd GUIEnter * cd ~/Google Drive/texts/
  " au GUIEnter * set fullscreen
  augroup END
endif

hi String guifg=white

" IME off on file open
au BufNewFile,BufRead * set iminsert=0

""" syntax option
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

augroup Buffer
  autocmd!
  " change current directory
  autocmd VimEnter * cd %:p:h

  " Trailing WhiteSpace
  autocmd BufWritePre * :%s/\s\+$//e

  " カーソル復元
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END
