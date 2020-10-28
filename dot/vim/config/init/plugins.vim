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
" Plug 'Shougo/context_filetype.vim'
Plug 'tyru/open-browser.vim'
Plug 'voldikss/vim-floaterm'

" editor UI
Plug 'itchyny/lightline.vim'
Plug 'RRethy/vim-illuminate'
Plug 'ghifarit53/tokyonight-vim'

" colorscheme
Plug 'w0ng/vim-hybrid'
Plug 'cocopon/iceberg.vim'
Plug 'jacoborus/tender.vim'
Plug 'morhetz/gruvbox'

""" fuzzy Finder
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }

""" filer
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'unkiwii/vim-nerdtree-sync'
" Plug 'ryanoasis/vim-devicons'

""" lsp & completion
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'mattn/vim-lsp-icons'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/asyncomplete-file.vim'
Plug 'akaimo/asyncomplete-around.vim'

Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

""" search
Plug 'rhysd/clever-f.vim'
Plug 'haya14busa/vim-asterisk'
Plug 'markonm/traces.vim'
Plug 'brooth/far.vim'

""" version control
Plug 'airblade/vim-gitgutter'

""" navigation / code completion
Plug 'pechorin/any-jump.vim'

""" editing utils
Plug 'chrismccord/bclose.vim'
Plug 'editorconfig/editorconfig-vim'
" Plug 'thinca/vim-quickrun'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-surround'
Plug 'tyru/caw.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'rizzatti/dash.vim'
Plug 'kannokanno/previm'
Plug 'andymass/vim-matchup'
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
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
" Ruby
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rails'
" backend / lang
Plug 'moll/vim-node'
Plug 'tpope/vim-rails'
Plug 'rust-lang/rust.vim'

call plug#end()

filetype plugin indent on
