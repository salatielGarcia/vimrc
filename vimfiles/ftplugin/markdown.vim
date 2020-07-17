setlocal spell spelllang=es_mx
setlocal conceallevel=3
nnoremap <Leader>pdx <Esc>:!pandoc %:t:r.html -o %:t:r.docx<CR>
nnoremap <Leader>pdh <Esc>:!pandoc % --filter pandoc-crossref --number-sections -o %:t:r.html<CR>

highlight markdownH1 guifg=#61AFEF
highlight markdownH2 guifg=#61AFEF
highlight markdownH3 guifg=#98C379
highlight markdownH4 guifg=#98C379
highlight markdownH5 guifg=#98C379
highlight markdownH6 guifg=#98C379
highlight markdownBold gui=bold guifg=#ABB2BF
highlight markdownItalic gui=italic guifg=#ABB2BF
highlight markdownListMarker guifg=#56b6C2
highlight markdownOrderedListMarker guifg=#61AFEF
highlight markdownLinkText guifg=#E5c07B
