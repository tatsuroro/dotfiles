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
Plug 'itchyny/lightline.vim'

" colorscheme
Plug 'w0ng/vim-hybrid'
Plug 'cocopon/iceberg.vim'
Plug 'jacoborus/tender.vim'
Plug 'morhetz/gruvbox'

""" fzf
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

""" filer
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'unkiwii/vim-nerdtree-sync'
Plug 'ryanoasis/vim-devicons'

""" version control
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'airblade/vim-gitgutter'

""" editing utils
Plug 'chrismccord/bclose.vim'
Plug 'editorconfig/editorconfig-vim'
" Plug 'thinca/vim-quickrun'
" Plug 'thinca/vim-template'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-surround'
Plug 'tyru/caw.vim'
Plug 'osyo-manga/vim-over'
Plug 'rhysd/clever-f.vim'
Plug 'haya14busa/vim-asterisk'
Plug 'jiangmiao/auto-pairs'
Plug 'rizzatti/dash.vim'
Plug 'kannokanno/previm'
Plug 'andymass/vim-matchup'

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

""" conquer of completation
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Ruby code completion
Plug 'osyo-manga/vim-monster'

""" syntax (language packs)
Plug 'sheerun/vim-polyglot'
Plug 'joker1007/vim-markdown-quote-syntax'
Plug 'mechatroner/rainbow_csv', { 'for': ['csv', 'tsv'] }
" frontend
Plug 'docunext/closetag.vim'
Plug 'leafgarland/typescript-vim'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'Quramy/vim-js-pretty-template'
Plug 'mattn/emmet-vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
" backend / lang
Plug 'moll/vim-node'
Plug 'tpope/vim-rails'

call plug#end()

filetype plugin indent on
