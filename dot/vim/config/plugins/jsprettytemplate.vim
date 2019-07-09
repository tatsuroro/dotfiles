" Register tag name associated the filetype
" call jspretmpl#register_tag('gql', 'graphql')

autocmd FileType typescript JsPreTmpl
autocmd FileType typescript syn clear foldBraces " For leafgarland/typescript-vim users only. Please see #1 for details.
