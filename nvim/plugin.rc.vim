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

" vim-easymotion
" Disable default mappings
let g:EasyMotion_do_mapping = 0
" Jump to first match with enter & space
let g:EasyMotion_enter_jump_first = 1
let g:EasyMotion_space_jump_first = 1

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

" Set async completion. With deoplete.nvim
let g:monster#completion#rcodetools#backend = 'async_rct_complete'

