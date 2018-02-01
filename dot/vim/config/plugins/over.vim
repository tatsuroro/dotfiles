scriptencoding utf-8

let g:over_enable_auto_nohlsearch = 1

" 単語指定して置換
nnoremap <silent> <Leader>o :OverCommandLine<CR>%s///g<Left><Left>

" カーソル下の単語をハイライト付きで置換
nmap <Leader>r <Space><Space>:OverCommandLine<CR>%s///g<Left><Left>

nnoremap sub :OverCommandLine<CR>%s/<C-r><C-w>//g<Left><Left>

" コピーした文字列をハイライト付きで置換
nnoremap subp y:OverCommandLine<CR>%s!<C-r>=substitute(@0, '!', '\\!', 'g')<CR>!!gI<Left><Left><Left>
