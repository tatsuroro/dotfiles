" Enable omni completion.
augroup Completion
  autocmd!
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
  autocmd FileType typescript setlocal completeopt+=menu,preview
  autocmd FileType typescript setlocal omnifunc=tsuquyomi#complete
  autocmd FileType go setlocal completeopt+=noinsert,noselect
augroup END

" call deoplete#custom#set('_', 'matchers', ['matcher_head'])
call deoplete#custom#set('ghc', 'sorters', ['sorter_word'])
" call deoplete#custom#set('buffer', 'mark', '')
" call deoplete#custom#set('_', 'matchers', ['matcher_full_fuzzy'])
" call deoplete#custom#set('_', 'disabled_syntaxes', ['Comment', 'String'])
" call deoplete#custom#set('buffer', 'mark', '*')

" Use auto delimiter
" call deoplete#custom#set('_', 'converters',
"       \ ['converter_auto_paren',
"       \  'converter_auto_delimiter', 'remove_overlap'])
call deoplete#custom#set('_', 'converters', [
      \ 'converter_remove_paren',
      \ 'converter_remove_overlap',
      \ 'converter_truncate_abbr',
      \ 'converter_truncate_menu',
      \ 'converter_auto_delimiter',
      \ ])

" call deoplete#custom#set('buffer', 'min_pattern_length', 9999)

let g:deoplete#keyword_patterns = {}
let g:deoplete#keyword_patterns._ = '[a-zA-Z_]\k*\(?'
let g:deoplete#keyword_patterns.tex = '[^\w|\s][a-zA-Z_]\w*'

let g:deoplete#omni#input_patterns = {}
" let g:deoplete#omni#input_patterns.python = ''
" let g:deoplete#omni#input_patterns.html = '<[^>]*'
" let g:deoplete#omni#input_patterns.xml = '<[^>]*'
" let g:deoplete#omni#input_patterns.md = '<[^>]*'
" let g:deoplete#omni#input_patterns.css = '^\s\+\w\+\|\w\+[):;]\?\s\+\w*\|[@!]'
" let g:deoplete#omni#input_patterns.scss = '^\s\+\w\+\|\w\+[):;]\?\s\+\w*\|[@!]'
" let g:deoplete#omni#input_patterns.sass = '^\s\+\w\+\|\w\+[):;]\?\s\+\w*\|[@!]'
" let g:deoplete#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)\w*'
" let g:deoplete#omni#input_patterns.cpp = ['[^. *\t]\.\w*', '[^. *\t]\::\w*', '[^. *\t]\->\w*', '[<"].*/']
" let g:deoplete#omni#input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
let g:deoplete#omni#input_patterns.typescript = '[^. *\t]\.\w*\|\h\w*::'

let g:deoplete#omni#functions = {}
" let g:deoplete#omni#functions.lua = 'xolox#lua#omnifunc'
let g:deoplete#omni#functions.typescript = 'tsuquyomi#complete'

" inoremap <silent><expr> <C-t> deoplete#mappings#manual_complete('file')

let g:deoplete#enable_refresh_always = 1
" let g:deoplete#enable_camel_case = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#auto_complete_start_length = 0
let g:auto_complete_start_length = 0

" compile_commands.json directory path
" Not file path. Need build directory path
" let g:deoplete#sources#clang#clang_complete_database =
"       \ expand('~/src/neovim/build')
"}}}

" call deoplete#enable_logging('DEBUG', 'deoplete.log')

let g:deoplete#ignore_sources = {'_': ['tag']}
