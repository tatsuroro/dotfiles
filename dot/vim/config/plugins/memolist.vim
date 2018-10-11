let g:memolist_memo_suffix = "txt"

let g:memolist_path = "$HOME/Google\ Drive/docs/memo"
let g:memolist_template_dir_path = "~/.vim/template/memolist"

let g:memolist_prompt_categories = 1
let g:memolist_prompt_tags = 1
" let g:memolist_qfixgrep = 1
let g:memolist_ex_cmd = 'CtrlP'

let g:memolist_delimiter_yaml_start = "---"
let g:memolist_delimiter_yaml_end  = "---"

"" keymap
nnoremap <Leader>mn  :MemoNew<CR>
nnoremap <Leader>ml  :MemoList<CR>
nnoremap <Leader>mg  :MemoGrep<CR>
