scriptencoding utf-8

" quickrun
let g:quickrun_config = {
  \   '_' : {
  \       'outputter/buffer/split' : ':botright',
  \       'outputter/buffer/close_on_empty' : 1
  \   },
  \}

runtime! plugins/ctrlp.rc.vim

" vim-js-indent
let g:js_indent_typescript = 1

" jsファイルで jsx シンタックスを有効にする
let g:jsx_ext_required = 0

" vim-gista
let g:gista#client#default_username = 'tatsuroro'

" vim-airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" indentLine
let g:indentLine_enabled = 0
let g:indentLine_color_term = 241
let g:indentLine_color_gui = '#eeeeee'
let g:indentLine_char = '¦' "use ¦, ┆ or │

" deoplete
let g:deoplete#enable_at_startup = 1
runtime! plugins/deoplete.rc.vim

" deoplete-ternjs
let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = '0'  " This do disable full signature type on autocomplete
"Add extra filetypes
let g:tern#filetypes = [
  \ 'jsx',
  \ 'javascript.jsx',
  \ 'typescript',
  \ 'typescript.tsx',
  \ 'vue',
  \ ]

" tmux-complete for deoplete
let g:tmuxcomplete#trigger = ''

" Set async completion. With deoplete.nvim
let g:monster#completion#rcodetools#backend = 'async_rct_complete'

" neosnippet
let g:neosnippet#enable_completed_snippet = 1

" neoformat
let g:neoformat_only_msg_on_error = 1
