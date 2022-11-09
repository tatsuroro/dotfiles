vim.cmd [[
try
  colorscheme tender
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry

" line numbers color
hi LineNr ctermbg=0 ctermfg=235
hi CursorLineNr ctermbg=4 ctermfg=0

hi CursorLine cterm=underline ctermfg=NONE ctermbg=NONE gui=underline guifg=NONE guibg=NONE
]]