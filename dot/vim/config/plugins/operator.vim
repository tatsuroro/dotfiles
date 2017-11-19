scriptencoding utf-8

""" operator-replace
nmap R <Plug>(operator-replace)

""" operator-surround
nmap <silent> sa <Plug>(operator-surround-append)
nmap <silent> sd <Plug>(operator-surround-delete)
nmap <silent> sr <Plug>(operator-surround-replace)

" カーソル位置から一番近い括弧を削除する
nmap <silent> sdd <Plug>(operator-surround-delete)<Plug>(textobj-multiblock-a)

" カーソル位置から一番近い括弧を変更する
nmap <silent> srr <Plug>(operator-surround-replace)<Plug>(textobj-multiblock-a)

""" 範囲内検索
nmap <Space>s <Plug>(operator-search)

" require - https://github.com/kana/vim-textobj-function
nmap <Space>/ <Plug>(operator-search)if
