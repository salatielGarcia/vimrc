setlocal foldmethod=indent
setlocal guioptions=!vAfcgt
" inoremap <F5> <Esc>:w<CR>:py3file % <CR>
" nnoremap <F5> :w<CR>:py3file % <CR>
inoremap <buffer> <F5> <Esc>:w<CR>:!python %<CR>
nnoremap <buffer> <F5> :w<CR>:!python %<CR>
