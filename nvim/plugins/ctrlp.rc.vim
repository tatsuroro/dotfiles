scriptencoding utf-8

" ctrlp
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_extensions = ['root', 'mixed']
let g:ctrlp_match_func = {'match': 'cpsm#CtrlPMatch'}
let g:ctrlp_match_window = 'bottom,min:1,max:40'
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/](node_modules|tmp|temp|\.(git|hg|hgn|svn))$',
  \ 'file': '\v\.(exe|so|dll|png|jpg|gif)$',
  \ 'link': '',
  \ }
let g:ctrlp_max_files = 100000
let g:ctrlp_max_depth = 40
" use mattn/files for file list (need to `go install mattn/files`)
let g:ctrlp_user_command = 'files -a -i "^(.git|node_modules)$" %s'
let g:ctrlp_prompt_mappings = { 'PrtExit()': ['<ESC>', '<c-g>', '<c-c>', '<c-q>'] }
let g:ctrlp_root_markers = ['.git', 'package.json', 'Gemfile', 'build.xml']

