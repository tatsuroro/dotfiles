scriptencoding utf-8

if (has("termguicolors"))
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
 set termguicolors
endif

" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

let macvim_skip_colorscheme=1

set background=dark

" line numbers color
hi LineNr ctermbg=0 ctermfg=235
hi CursorLineNr ctermbg=4 ctermfg=0

" hi clear CursorLine
" hi CursorLine ctermbg=236 guibg=darked
hi CursorLine cterm=underline ctermfg=NONE ctermbg=NONE gui=underline guifg=NONE guibg=NONE

" !! colorsheme -> /plugins/color
