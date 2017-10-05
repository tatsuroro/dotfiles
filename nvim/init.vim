scriptencoding utf-8
filetype off

let g:python3_host_prog = '/usr/local/bin/python3'
if has('multi_lang')
  language C
endif

if $SHELL =~? '/fish$'
  set shell=bash
endif

" -----
" vim-plug
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  augroup pluginstall
    autocmd!
    autocmd VimEnter * PlugInstall | source $MYVIMRC
  augroup END
endif

call plug#begin('~/.local/share/nvim/plugged')

Plug 'AndrewRadev/switch.vim'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'nixprime/cpsm', { 'dir': '~/.local/share/nvim/plugged/cpsm/', 'do': 'env PY3=ON ./install.sh' }
Plug 'ctrlpvim/ctrlp.vim'
  Plug 'mattn/ctrlp-filer'
  Plug 'mattn/ctrlp-register'
  Plug 'ompugao/ctrlp-history'
  Plug 'endel/ctrlp-filetype.vim'
  Plug 'lokikl/vim-ctrlp-ag'
  Plug 'lambdalisue/vim-gista'
  Plug 'lambdalisue/vim-gista-ctrlp'
Plug 'editorconfig/editorconfig-vim'
Plug 'cocopon/vaffle.vim'
Plug 'chrismccord/bclose.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
Plug 'kana/vim-submode'
Plug 't9md/vim-quickhl'
Plug 'thinca/vim-template'
Plug 'thinca/vim-quickrun'
Plug 'osyo-manga/vim-over'
Plug 'tyru/caw.vim'
Plug 'matchit.zip'
Plug 'ruby-matchit'
Plug 'smartchr'
Plug 'rhysd/clever-f.vim'
Plug 'kana/vim-textobj-user'
  Plug 'kana/vim-textobj-entire'
  Plug 'kana/vim-textobj-function'
  Plug 'kana/vim-textobj-indent'
  Plug 'kana/vim-textobj-datetime'
  Plug 'mattn/vim-textobj-url'
  Plug 'osyo-manga/vim-textobj-multiblock'
  Plug 'thinca/vim-textobj-between'
Plug 'kana/vim-operator-user'
  Plug 'kana/vim-operator-replace'
  Plug 'osyo-manga/vim-operator-search'
  Plug 'rhysd/vim-operator-surround'
  Plug 'thinca/vim-operator-sequence'
" display
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'
Plug 'kannokanno/previm'
" colorsceme
Plug 'w0ng/vim-hybrid'
" completement
Plug 'Shougo/context_filetype.vim'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-go', { 'do': 'make' }
Plug 'zchee/deoplete-zsh'
Plug 'fishbullet/deoplete-ruby'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm i -g tern' }
Plug 'mhartington/nvim-typescript'
Plug 'wellle/tmux-complete.vim'
Plug 'ujihisa/neco-look'
Plug 'Shougo/neco-vim'
Plug 'Shougo/neco-syntax'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'Quramy/tsuquyomi', { 'for': ['typescript', 'tsx'] }
" code style
Plug 'sbdchd/neoformat'
Plug 'w0rp/ale'
Plug 'jason0x43/vim-js-indent'
" syntax highlight
Plug 'osyo-manga/vim-monster'
Plug 'tpope/vim-rails'
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'leafgarland/typescript-vim', { 'for': ['typescript', 'tsx'] }
Plug 'moll/vim-node'
Plug 'digitaltoad/vim-pug'
Plug 'elzr/vim-json'
Plug 'othree/html5.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'cakebaker/scss-syntax.vim'
Plug 'cespare/vim-toml'
Plug 'rcmdnk/vim-markdown'
Plug 'joker1007/vim-markdown-quote-syntax'
Plug 'dart-lang/dart-vim-plugin'
Plug 'mechatroner/rainbow_csv', { 'for': ['csv', 'tsv'] }
Plug 'evanmiller/nginx-vim-syntax'
Plug 'dag/vim-fish'

call plug#end()

filetype plugin indent on

runtime! option.rc.vim
runtime! plugin.rc.vim
runtime! keymap.rc.vim

