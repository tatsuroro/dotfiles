scriptencoding utf-8
filetype off

" -----
" vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  augroup pluginstall
    autocmd!
    autocmd VimEnter * PlugInstall | source $MYVIMRC
  augroup END
endif

call plug#begin('~/.vim/plugged')

""" enhancement
Plug 'nixprime/cpsm', { 'dir': '~/.local/share/nvim/plugged/cpsm/', 'do': 'env PY3=ON ./install.sh' }
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'Shougo/context_filetype.vim'

""" Launcher
Plug 'Shougo/neomru.vim'
Plug 'Shougo/denite.nvim'

Plug 'ctrlpvim/ctrlp.vim'
  Plug 'mattn/ctrlp-filer'
  Plug 'mattn/ctrlp-register'
  Plug 'ompugao/ctrlp-history'
  Plug 'endel/ctrlp-filetype.vim'
  Plug 'lokikl/vim-ctrlp-ag'
  Plug 'lambdalisue/vim-gista'
  Plug 'lambdalisue/vim-gista-ctrlp'

""" filer
Plug 'cocopon/vaffle.vim'

""" version control
Plug 'lambdalisue/gina.vim'

""" editing utils
Plug 'chrismccord/bclose.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'thinca/vim-quickrun'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-surround'
Plug 'tyru/caw.vim'
Plug 'osyo-manga/vim-over'
Plug 'rhysd/clever-f.vim'
Plug 't9md/vim-quickhl'
Plug 'thinca/vim-template'
Plug 'haya14busa/vim-asterisk'
Plug 'jiangmiao/auto-pairs'

""" text obj / operator
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

""" code lint / styling
Plug 'w0rp/ale'

""" snippet
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'

""" completement
Plug 'Shougo/deoplete.nvim'
Plug 'zchee/deoplete-go', { 'do': 'make' }
Plug 'zchee/deoplete-zsh'
Plug 'fishbullet/deoplete-ruby'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm i -g tern' }
Plug 'wellle/tmux-complete.vim'
Plug 'ujihisa/neco-look'
Plug 'Shougo/neco-vim'
Plug 'Shougo/neco-syntax'

" lang support
Plug 'Quramy/tsuquyomi', { 'for': ['typescript', 'tsx'] }

""" syntax highlight
" shell / script
Plug 'dag/vim-fish'

" frontend
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
Plug 'leafgarland/typescript-vim', { 'for': ['typescript', 'tsx'] }
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'elzr/vim-json'
Plug 'digitaltoad/vim-pug'
Plug 'othree/html5.vim'
Plug 'mattn/emmet-vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'cakebaker/scss-syntax.vim'

" backend / lang
Plug 'moll/vim-node'
Plug 'osyo-manga/vim-monster'
Plug 'tpope/vim-rails'
Plug 'dart-lang/dart-vim-plugin'

" misc
Plug 'cespare/vim-toml'
Plug 'rcmdnk/vim-markdown'
Plug 'joker1007/vim-markdown-quote-syntax'
Plug 'mechatroner/rainbow_csv', { 'for': ['csv', 'tsv'] }

"""

" markdown preview
Plug 'kannokanno/previm'

" editor UI
Plug 'itchyny/lightline.vim'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'

" colorscheme
Plug 'w0ng/vim-hybrid'
Plug 'cocopon/iceberg.vim'

call plug#end()

filetype plugin indent on
