setlocal guioptions=!vAfcgLt
nnoremap <buffer> <F5> :so %<CR>
nnoremap <buffer> <C-i> :PluginInstall<CR>
nnoremap <buffer> <C-c> :PluginClean<CR>
let b:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', '<':'>'}
