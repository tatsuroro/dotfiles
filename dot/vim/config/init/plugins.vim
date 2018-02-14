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
Plug 'nixprime/cpsm', { 'dir': '~/.vim/plugged/cpsm/', 'do': 'env PY3=ON ./install.sh' }
Plug 'Shougo/context_filetype.vim'

" Plug 'roxma/nvim-yarp'
" Plug 'roxma/vim-hug-neovim-rpc'

" editor UI
Plug 'itchyny/lightline.vim'
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'

" colorscheme
Plug 'w0ng/vim-hybrid'
Plug 'cocopon/iceberg.vim'

""" launcher
Plug 'ctrlpvim/ctrlp.vim'
  Plug 'mattn/ctrlp-filer'
  Plug 'mattn/ctrlp-register'
  Plug 'mattn/ctrlp-ghq'
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
Plug 'fuenor/qfixgrep'
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
Plug 'rizzatti/dash.vim'
Plug 'glidenote/memolist.vim'
Plug 'kannokanno/previm'

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

" """ snippet
" Plug 'Shougo/neosnippet'
" Plug 'Shougo/neosnippet-snippets'

""" complement
" Plug 'Shougo/deoplete.nvim'
" Plug 'zchee/deoplete-go', { 'do': 'make' }
" Plug 'zchee/deoplete-zsh'
" Plug 'fishbullet/deoplete-ruby'
" Plug 'carlitux/deoplete-ternjs', { 'do': 'npm i -g tern' }
" Plug 'wellle/tmux-complete.vim'
" Plug 'ujihisa/neco-look'
"

""" lang support
" Plug 'Quramy/tsuquyomi', { 'for': ['typescript', 'tsx'] }

""" Language Server Protocol Client
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'

""" complementation
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/asyncomplete-buffer.vim'
Plug 'prabirshrestha/asyncomplete-file.vim'
" Plug 'prabirshrestha/asyncomplete-neosnippet.vim'
Plug 'wellle/tmux-complete.vim'
Plug 'Shougo/neco-syntax'
Plug 'prabirshrestha/asyncomplete-necosyntax.vim'
Plug 'Shougo/neco-vim'
Plug 'prabirshrestha/asyncomplete-necovim.vim'

""" syntax
Plug 'dag/vim-fish'
Plug 'cespare/vim-toml'
Plug 'rcmdnk/vim-markdown'
Plug 'joker1007/vim-markdown-quote-syntax'
Plug 'mechatroner/rainbow_csv', { 'for': ['csv', 'tsv'] }

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

call plug#end()

filetype plugin indent on
