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
Plug 'Shougo/context_filetype.vim'
Plug 'tyru/open-browser.vim'

" editor UI

" colorscheme
Plug 'jacoborus/tender.vim'

""" fuzzy Finder

""" lsp

""" completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

""" search
Plug 'rhysd/clever-f.vim'
Plug 'haya14busa/vim-asterisk'
Plug 'markonm/traces.vim'
Plug 'brooth/far.vim'

""" version control
Plug 'lewis6991/gitsigns.nvim'

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
Plug 'w0rp/ale'
Plug 'maximbaz/lightline-ale'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

""" syntax
Plug 'joker1007/vim-markdown-quote-syntax'
" frontend
Plug 'docunext/closetag.vim'
Plug 'leafgarland/typescript-vim'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'hail2u/vim-css3-syntax'
" backend / lang

call plug#end()

filetype plugin indent on
