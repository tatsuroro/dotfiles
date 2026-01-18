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
Plug 'tyru/open-browser.vim'

" editor UI

" colorscheme
Plug 'jacoborus/tender.vim'

""" fuzzy Finder

""" lsp

""" completion

""" search
Plug 'rhysd/clever-f.vim'
Plug 'haya14busa/vim-asterisk'
Plug 'markonm/traces.vim'
Plug 'brooth/far.vim'

""" version control
Plug 'airblade/vim-gitgutter'

""" code navigation
Plug 'pechorin/any-jump.vim'

""" editing utils
Plug 'chrismccord/bclose.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-surround'
Plug 'tyru/caw.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'rizzatti/dash.vim'
Plug 'kannokanno/previm'
Plug 'mattn/vim-sonictemplate'

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

""" syntax
Plug 'joker1007/vim-markdown-quote-syntax'

call plug#end()

filetype plugin indent on
