scriptencoding utf-8

let g:python3_host_prog = '/usr/local/bin/python3'
if has('multi_lang')
  language C
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
Plug 'nixprime/cpsm', { 'dir': '~/.local/share/nvim/plugged/cpsm/', 'do': 'env PY3=ON ./install.sh' }
Plug 'ctrlpvim/ctrlp.vim'
  Plug 'mattn/ctrlp-filer'
  Plug 'ompugao/ctrlp-history'
  Plug 'endel/ctrlp-filetype.vim'
  Plug 'lokikl/vim-ctrlp-ag'
  Plug 'lambdalisue/vim-gista'
  Plug 'lambdalisue/vim-gista-ctrlp'
Plug 'editorconfig/editorconfig-vim'
" Plug 'justinmk/vim-dirvish'
Plug 'cocopon/vaffle.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
Plug 'kana/vim-submode'
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
Plug 't9md/vim-quickhl'
Plug 'tyru/caw.vim'
Plug 'w0rp/ale'
Plug 'chrismccord/bclose.vim'
Plug 'easymotion/vim-easymotion'
" visual
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0ng/vim-hybrid'
Plug 'Yggdroot/indentLine'
" deo
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/context_filetype.vim'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'Shougo/neosnippet'
" syntax
Plug 'osyo-manga/vim-monster', { 'for': 'ruby' }
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'jsx'] }
Plug 'Quramy/tsuquyomi', { 'for': ['typescript', 'tsx'] }
Plug 'leafgarland/typescript-vim', { 'for': ['typescript', 'tsx'] }
Plug 'mxw/vim-jsx', { 'for': ['jsx', 'tsx'] }
Plug 'jason0x43/vim-js-indent', { 'for': ['javascript', 'typescript', 'html', 'jsx', 'tsx' ] }
Plug 'moll/vim-node', { 'for': 'node' }
Plug 'digitaltoad/vim-pug', { 'for': ['slim', 'jade', 'pug'] }
Plug '5t111111/neat-json.vim', { 'for': 'json' }
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }
Plug 'cespare/vim-toml', {'for': 'toml' }
Plug 'mechatroner/rainbow_csv', {'for': ['csv', 'tsv']}
call plug#end()

runtime! option.rc.vim
runtime! plugin.rc.vim
runtime! keymap.rc.vim

