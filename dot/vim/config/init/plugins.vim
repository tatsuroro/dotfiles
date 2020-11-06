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
Plug 'voldikss/vim-floaterm'

" editor UI
Plug 'itchyny/lightline.vim'
Plug 'RRethy/vim-illuminate'

" colorscheme
Plug 'w0ng/vim-hybrid'
Plug 'cocopon/iceberg.vim'
Plug 'jacoborus/tender.vim'
Plug 'morhetz/gruvbox'
Plug 'ghifarit53/tokyonight-vim'
Plug 'lu-ren/SerialExperimentsLain'
Plug 'rakr/vim-one'
Plug 'tyrannicaltoucan/vim-deep-space'
Plug 'larsbs/vimterial_dark'

""" fuzzy Finder
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }

""" lsp
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'mattn/vim-lsp-icons'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

""" completion
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/asyncomplete-file.vim'
Plug 'akaimo/asyncomplete-around.vim'

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
" backend / lang
Plug 'rust-lang/rust.vim'

call plug#end()

filetype plugin indent on
